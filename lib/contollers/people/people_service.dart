import 'dart:async';

import 'package:chopper/chopper.dart';
import 'dart:convert';

part '../../gen/contollers/people/people_service.chopper.dart';

@ChopperApi()
abstract class PeopleService extends ChopperService {
  Future<PeopleBackendResponse> getVisitors(int page, int quantity) async {
    Response res = (await _getUsers(page, quantity, "regular_user"));
    return converResponse(res);
  }

  Future<PeopleBackendResponse> getTrainers(int page, int quantity) async {
    Response res = (await _getUsers(page, quantity, "coach"));
    return converResponse(res);
  }

  Future<PeopleBackendResponse> getStaff(int page, int quantity) async {
    Response res = (await _getUsers(page, quantity, "admin"));
    return converResponse(res);
  }

  @Get(path: "/user/view")
  Future<Response> _getUsers(@Query("page") int page, @Query("quantity") int quantity, @Query("type") String type);

  static PeopleService create([ChopperClient? client]) => _$PeopleService(client);
}

FutureOr<PeopleBackendResponse> converResponse(Response res) {
  if (!res.isSuccessful) {
    PeopleBackendResponse response = PeopleBackendResponse();
    response.isSuccess = false;
    return response;
  }

  String jsonBody = const Utf8Decoder().convert(res.bodyBytes);
  List<dynamic> json = jsonDecode(jsonBody);

  List<PersonBackendModel> personList = json.map((e) => PersonBackendModel.fromJson(e)).toList();

  PeopleBackendResponse response = PeopleBackendResponse();
  response.isSuccess = true;
  response.personList = personList;
  return response;
}

class PeopleBackendResponse {
  late bool isSuccess;

  List<PersonBackendModel>? personList;
}

class PersonBackendModel {
  int? id;
  String? gender;
  String? birthdate;
  String? status;
  String? phoneNumber;
  String? email;
  String? type;
  String? name;
  String? lastVisit;

  PersonBackendModel(
      {this.id,
      this.gender,
      this.birthdate,
      this.status,
      this.phoneNumber,
      this.email,
      this.type,
      this.name,
      this.lastVisit});

  PersonBackendModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    status = json['status'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    type = json['type'];
    name = json['name'];
    lastVisit = json['last_visit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['status'] = status;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['type'] = type;
    data['name'] = name;
    data['last_visit'] = lastVisit;
    return data;
  }
}
