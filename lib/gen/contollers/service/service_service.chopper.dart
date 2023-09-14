// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../contollers/service/service_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_string_interpolations, unnecessary_brace_in_string_interps
final class _$ServiceService extends ServiceService {
  _$ServiceService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ServiceService;

  @override
  Future<Response<dynamic>> _getPlan(dynamic screen) {
    final Uri $url = Uri.parse('/plan/view');
    final Map<String, dynamic> $params = <String, dynamic>{'screen': screen};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
