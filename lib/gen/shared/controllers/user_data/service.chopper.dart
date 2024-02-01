// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../shared/controllers/user_data/service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$UserDataService extends UserDataService {
  _$UserDataService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = UserDataService;

  @override
  Future<Response<dynamic>> _getUserData() {
    final Uri $url = Uri.parse('/user/view');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
