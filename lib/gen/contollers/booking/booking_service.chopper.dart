// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../contollers/booking/booking_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_string_interpolations, unnecessary_brace_in_string_interps
final class _$BookingService extends BookingService {
  _$BookingService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = BookingService;

  @override
  Future<Response<dynamic>> _getBooking(
    String screen,
    String userId,
  ) {
    final Uri $url = Uri.parse('/booking/view');
    final Map<String, dynamic> $params = <String, dynamic>{
      'screen': screen,
      'user_id': userId,
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
