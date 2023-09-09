// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../contollers/token/token_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_string_interpolations, unnecessary_brace_in_string_interps
final class _$TokenService extends TokenService {
  _$TokenService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TokenService;

  @override
  Future<Response<dynamic>> _tryToLRefreshToken(String refreshToken) {
    final Uri $url = Uri.parse('/auth/refresh');
    final $body = <String, dynamic>{'refresh_token': refreshToken};
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
