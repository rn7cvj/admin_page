import 'dart:async';

import 'package:chopper/chopper.dart';

part '../../../gen/shared/controllers/user_data/service.chopper.dart';

@ChopperApi()
abstract class UserDataService extends ChopperService {
  Future<UserDataBackendResponse> getUserData() async {
    Response response = await _getUserData();
    return await converResponse(response);
  }

  @Get(path: "/user/view")
  Future<Response> _getUserData();

  static UserDataService create([ChopperClient? client]) =>
      _$UserDataService(client);
}

FutureOr<UserDataBackendResponse> converResponse(Response res) {
  if (!res.isSuccessful) {
    UserDataBackendResponse newBody =
        UserDataBackendResponse(isSuccess: false, data: null);
    return newBody;
  }

  return UserDataBackendResponse(isSuccess: true, data: res.body);
}

class UserDataBackendResponse {
  final bool isSuccess;

  final dynamic data;

  UserDataBackendResponse({required this.isSuccess, required this.data});
}
