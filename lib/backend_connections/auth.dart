import 'dart:async';

import 'package:admin_page/models/person.dart';
import 'package:chopper/chopper.dart';
import 'dart:convert';

import '../logger.dart';

part 'auth.chopper.dart';

@ChopperApi()
abstract class AuthService extends ChopperService {
  Future<AuthResponse?> tryToLogin(String email, String password) async => (await _tryToLogin(email, password)).body;

  @FactoryConverter(
    // request: FormUrlEncodedConverter.requestFactory,
    response: converResponse,
  )
  @Post(path: "/auth/login")
  Future<Response<AuthResponse>> _tryToLogin(
    @Field("email") String email,
    @Field("password") String password,
  );

  static AuthService create([ChopperClient? client]) => _$AuthService(client);
}

FutureOr<Response<AuthResponse>> converResponse(Response res) {
  if (!res.isSuccessful) {
    AuthResponse newBody = AuthResponse();
    newBody.isSuccess = false;
    return res.copyWith(body: newBody);
  }
  // String jsonBody = res.bodyString;
  String jsonBody = Utf8Decoder().convert(res.bodyBytes);
  dynamic json = jsonDecode(jsonBody);

  AuthResponse newBody = AuthResponse();
  newBody.isSuccess = true;

  newBody.refreshToken = json["data"]["refresh_token"];
  newBody.token = json["data"]["token"];

  return res.copyWith(body: newBody);
}

class AuthResponse {
  late bool isSuccess;

  String? token;
  String? refreshToken;
}
