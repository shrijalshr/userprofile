import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:userprofile/common/helper/app_logger.dart';

import '../../../../common/config/network/api_exceptions.dart';
import '../../../../data/model/user_model.dart';
import '../../../../data/repo/user_repo.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfilesBloc extends Bloc<UserProfilesEvent, UserProfilesState> {
  final UserRepo? _userRepo;

  UserProfilesBloc(this._userRepo) : super(UserProfileLoading()) {
    on<LoadUsers>((event, emit) async {
      AppLogger.logWarning("Current event: ${event.toString()}");
      emit(UserProfileLoading());
      try {
        final List<UserModel>? users = await _userRepo?.getUserProfiles();
        users?.forEach((element) {
          AppLogger.logInfo(element.toMap());
        });
        emit(UserProfilesLoaded(users: users));
      } on BadRequestException {
        emit(UserProfilesFailed("Bad Request. Please try again later"));
      } on InternalServerErrorException {
        emit(UserProfilesFailed(
            "Internal Server Error. Please try again later"));
      } on NotFoundException {
        emit(
            UserProfilesFailed("The requested information could not be found"));
      } on NoInternetConnectionException {
        emit(UserProfilesFailed(
            "Something went wrong. Please check internet connection and try again"));
      } catch (e) {
        emit(UserProfilesFailed(e.toString()));
      }
    });
  }
}
