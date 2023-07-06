part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfilesState {}

class UserProfilesInitial extends UserProfilesState {}

class UserProfileLoading extends UserProfilesState {
  UserProfileLoading();
}

class UserProfilesLoaded extends UserProfilesState {
  final List<UserModel>? users;

  UserProfilesLoaded({this.users});

  @override
  List<Object?> get props => [users];
}

class UserProfilesFailed extends UserProfilesState {
  final String? error;

  UserProfilesFailed(this.error);
  @override
  List<Object?> get props => [error];
}
