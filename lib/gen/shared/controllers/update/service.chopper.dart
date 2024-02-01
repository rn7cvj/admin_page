// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../shared/controllers/update/service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$UpdateService extends UpdateService {
  _$UpdateService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = UpdateService;

  @override
  Future<Response<dynamic>> getActualVersion() {
    final Uri $url = Uri.parse('');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
