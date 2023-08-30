import 'dart:async';

import 'package:admin_page/models/person.dart';
import 'package:chopper/chopper.dart';
import 'dart:convert';

part 'people.chopper.dart';

@ChopperApi()
abstract class PeopleService extends ChopperService {
  Future<List<PersonViewModel>?> getVisitors(int page, int quantity) async =>
      (await _getUsers(page, quantity, "regular_user")).body;

  Future<List<PersonViewModel>?> getTrainers(int page, int quantity) async =>
      (await _getUsers(page, quantity, "coach")).body;

  Future<List<PersonViewModel>?> getStaff(int page, int quantity) async =>
      (await _getUsers(page, quantity, "admin")).body;

  @FactoryConverter(
    request: FormUrlEncodedConverter.requestFactory,
    response: converResponse,
  )
  @Get(path: "/user/view")
  Future<Response<List<PersonViewModel>>> _getUsers(
      @Query("page") int page, @Query("quantity") int quantity, @Query("type") String type);

  static PeopleService create([ChopperClient? client]) => _$PeopleService(client);
}

FutureOr<Response<List<PersonViewModel>>> converResponse(Response res) {
  // String jsonBody = res.bodyString;
  String jsonBody = Utf8Decoder().convert(res.bodyBytes);
  List<dynamic> json = jsonDecode(jsonBody);

  List<PersonViewModel> newBody = json.map((e) => PersonViewModel.fromJson(e)).toList();

  return res.copyWith(body: newBody);
}
