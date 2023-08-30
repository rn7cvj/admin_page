// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
final class _$PeopleService extends PeopleService {
  _$PeopleService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PeopleService;

  @override
  Future<Response<List<PersonViewModel>>> _getUsers(
    int page,
    int quantity,
    String type,
  ) {
    final Uri $url = Uri.parse('/user/view');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'quantity': quantity,
      'type': type,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<PersonViewModel>, PersonViewModel>(
      $request,
      requestConverter: FormUrlEncodedConverter.requestFactory,
      responseConverter: converResponse,
    );
  }
}
