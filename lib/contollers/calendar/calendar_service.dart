import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';

part '../../gen/contollers/calendar/calendar_service.chopper.dart';

@ChopperApi()
abstract class CalendarService extends ChopperService {
  Future<CalendarBackendResponse> getEvent(int page, int quantity, String lang) async {
    Response res = await _getEvent(page, quantity, "admin_panel", lang);

    return convertResponse(res);
  }

  @Get(path: "/event/view")
  Future<Response> _getEvent(
    @Query("page") int page,
    @Query("quantity") int quantity,
    @Query("screen") String screen,
    @Query("lang") String lang,
  );

  @Get(path: "/excel/export")
  Future<Response> exportExcel();

  @Post(path: "/excel/import")
  Future<Response> importExcel(@Field("file") String file);

  static CalendarService create([ChopperClient? client]) => _$CalendarService(client);
}

FutureOr<CalendarBackendResponse> convertResponse(Response res) {
  if (!res.isSuccessful) {
    CalendarBackendResponse response = CalendarBackendResponse();
    response.isSuccess = false;

    return response;
  }

  CalendarBackendResponse response = CalendarBackendResponse();
  response.isSuccess = true;

  String jsonBody = const Utf8Decoder().convert(res.bodyBytes);
  List<dynamic> json = jsonDecode(jsonBody);

  List<EventBackendModel> events = json.map((e) => EventBackendModel.fromJson(e)).toList();

  response.events = events;

  return response;
}

class CalendarBackendResponse {
  late bool isSuccess;

  List<EventBackendModel>? events;
}

class EventBackendModel {
  int? id;
  String? eventName;
  String? beginTime;
  String? endTime;
  String? coachPhoneNumber;
  String? coachEmail;
  String? buildingName;
  int? totalSpaces;
  int? occupiedSpaces;
  String? areaName;
  bool? active;
  String? coachName;

  EventBackendModel(
      {this.id,
      this.eventName,
      this.beginTime,
      this.endTime,
      this.coachPhoneNumber,
      this.coachEmail,
      this.buildingName,
      this.totalSpaces,
      this.occupiedSpaces,
      this.areaName,
      this.active,
      this.coachName});

  EventBackendModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventName = json['event_name'];
    beginTime = json['begin_time'];
    endTime = json['end_time'];
    coachPhoneNumber = json['coach_phone_number'];
    coachEmail = json['coach_email'];
    buildingName = json['building_name'];
    totalSpaces = json['total_spaces'];
    occupiedSpaces = json['occupied_spaces'];
    areaName = json['area_name'];
    active = json['active'];
    coachName = json['coach_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['event_name'] = this.eventName;
    data['begin_time'] = this.beginTime;
    data['end_time'] = this.endTime;
    data['coach_phone_number'] = this.coachPhoneNumber;
    data['coach_email'] = this.coachEmail;
    data['building_name'] = this.buildingName;
    data['total_spaces'] = this.totalSpaces;
    data['occupied_spaces'] = this.occupiedSpaces;
    data['area_name'] = this.areaName;
    data['active'] = this.active;
    data['coach_name'] = this.coachName;
    return data;
  }
}
