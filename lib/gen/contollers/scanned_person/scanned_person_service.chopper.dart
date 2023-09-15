// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../contollers/scanned_person/scanned_person_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_string_interpolations, unnecessary_brace_in_string_interps
final class _$ScannedPersonService extends ScannedPersonService {
  _$ScannedPersonService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ScannedPersonService;

  @override
  Future<Response<dynamic>> _getUserData(
    String userId,
    String lenght,
  ) {
    final Uri $url = Uri.parse('/user/view');
    final Map<String, dynamic> $params = <String, dynamic>{
      'user_id': userId,
      'length': lenght,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
