import 'package:userprofile/common/config/network/api_endpoint.dart';
import 'package:userprofile/common/config/network/dio_client.dart';
import 'package:userprofile/data/model/user_model.dart';

class UserRepo {
  UserRepo._internal();

  factory UserRepo() {
    return UserRepo._internal();
  }

  final DioClient _dioClient = DioClient();
  Future<List<UserModel>> getUserProfiles() async {
    List<UserModel> users =
        await _dioClient.get(ApiEndPoints.users).then((res) {
      List<UserModel> users = (res as List<dynamic>)
          .map<UserModel>((u) => UserModel.fromMap(u))
          .toList();
      return users;
    });
    return users;
  }
}
