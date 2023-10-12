// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../contollers/calendar/calendar_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_string_interpolations, unnecessary_brace_in_string_interps
final class _$CalendarService extends CalendarService {
  _$CalendarService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CalendarService;

  @override
  Future<Response<dynamic>> _getEvent(
    int page,
    int quantity,
    String screen,
    String lang,
  ) {
    final Uri $url = Uri.parse('/event/view');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'quantity': quantity,
      'screen': screen,
      'lang': lang,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> exportExcel() {
    final Uri $url = Uri.parse('/excel/export');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> importExcel(String file) {
    final Uri $url = Uri.parse('/excel/import');
    final $body = <String, dynamic>{'file': file};
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
