import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';

part '../../gen/contollers/auth/auth_service.chopper.dart';

@ChopperApi()
abstract class AuthService extends ChopperService {
  Future<AuthBackendResponse> tryToLogin(String email, String password) async {
    Response response = (await _tryToLogin(email, password));
    return await converResponse(response);
  }

  @Post(path: "/auth/login")
  Future<Response> _tryToLogin(
    @Field("email") String email,
    @Field("password") String password,
  );

  static AuthService create([ChopperClient? client]) => _$AuthService(client);
}

FutureOr<AuthBackendResponse> converResponse(Response res) {
  if (!res.isSuccessful) {
    AuthBackendResponse newBody = AuthBackendResponse();
    newBody.isSuccess = false;
    return newBody;
  }
  // String jsonBody = res.bodyString;
  String jsonBody = const Utf8Decoder().convert(res.bodyBytes);
  dynamic json = jsonDecode(jsonBody);

  AuthBackendResponse newBody = AuthBackendResponse();
  newBody.isSuccess = true;

  newBody.refreshToken = json["data"]["refresh_token"];
  newBody.token = json["data"]["token"];

  return newBody;
}

class AuthBackendResponse {
  late bool isSuccess;

  String? token;
  String? refreshToken;
}
