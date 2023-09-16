// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../contollers/scanned/scanned_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_string_interpolations, unnecessary_brace_in_string_interps
final class _$ScannedService extends ScannedService {
  _$ScannedService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ScannedService;

  @override
  Future<Response<dynamic>> _scanQr(String qrToken) {
    final Uri $url = Uri.parse('/qr/scan');
    final $body = <String, dynamic>{'qr_token': qrToken};
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
