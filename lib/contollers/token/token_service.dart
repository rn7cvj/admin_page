import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
part '../../gen/contollers/token/token_service.chopper.dart';

@ChopperApi()
abstract class TokenService extends ChopperService {
  Future<TokenBackendResponse> tryToLRefreshToken(String refreshToken) async {
    Response response = (await _tryToLRefreshToken(refreshToken));
    return await converResponse(response);
  }

  @Post(path: "/auth/refresh")
  Future<Response> _tryToLRefreshToken(
    @Field("refresh_token") String refreshToken,
  );

  static TokenService create([ChopperClient? client]) => _$TokenService(client);
}

Future<TokenBackendResponse> converResponse(Response res) async {
  if (!res.isSuccessful) {
    TokenBackendResponse response = TokenBackendResponse();
    response.isSuccess = false;

    return response;
  }

  String jsonBody = const Utf8Decoder().convert(res.bodyBytes);
  dynamic json = jsonDecode(jsonBody);

  TokenBackendResponse response = TokenBackendResponse();

  response.isSuccess = true;

  response.newToken = json["data"]["token"];
  response.newRefreshToken = json["data"]["refresh_token"];

  return response;
}

class TokenBackendResponse {
  late bool isSuccess;

  String? newToken;
  String? newRefreshToken;
}
