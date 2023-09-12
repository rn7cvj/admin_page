import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
part '../../gen/contollers/building/building_service.chopper.dart';

@ChopperApi()
abstract class BuildingService extends ChopperService {
  Future<BuildingBackendResponse> getBuilding() async {
    Response res = (await _getBuilding("admin_panel"));

    return converGetBuidlingResponse(res);
  }

  Future<AddBuildingBackendResponse> addBuidling(String buildingName) async {
    Response res = (await _addBuilding(buildingName));
    return convertAddBuildingResponse(res);
  }

  Future<void> deleteBuidling(int buildingId) async {
    await _deleteBuilding(buildingId);
  }

  Future<void> activateBuilding(int buildingId, String buildingName) async {
    await _editBuilding(buildingId, buildingName, true);
  }

  @Get(path: "/building/view")
  Future<Response> _getBuilding(@Query("screen") screen);

  @Post(path: "/building/add")
  Future<Response> _addBuilding(@Field("building_name") String buildingName);

  @Post(path: "/building/delete")
  Future<Response> _deleteBuilding(@Query("building_id") int buidlingId);

  @Post(path: "/building/edit")
  Future<Response> _editBuilding(
      @Query("building_id") int buildingId, @Field("building_name") buildingName, @Field("active") bool active);

  static BuildingService create([ChopperClient? client]) => _$BuildingService(client);
}

FutureOr<BuildingBackendResponse> converGetBuidlingResponse(Response res) {
  if (!res.isSuccessful) {
    return BuildingBackendResponse(isSuccess: false, buildingList: null);
  }

  String jsonBody = const Utf8Decoder().convert(res.bodyBytes);
  List<dynamic> json = jsonDecode(jsonBody);

  List<BuildingBackendModel> buildingList = [];

  buildingList = json.map((e) => BuildingBackendModel.fromJson(e)).toList();

  return BuildingBackendResponse(isSuccess: true, buildingList: buildingList);
}

FutureOr<AddBuildingBackendResponse> convertAddBuildingResponse(Response res) {
  if (res.statusCode == 400) {
    String jsonBody = const Utf8Decoder().convert(res.bodyBytes);
    dynamic json = jsonDecode(jsonBody);

    return AddBuildingBackendResponse(isSuccess: true, status: AddBuildingStatus.buildingAlradyExist);
  }

  if (!res.isSuccessful) {
    return AddBuildingBackendResponse(isSuccess: false, status: AddBuildingStatus.buildingAlradyExist);
  }

  return AddBuildingBackendResponse(isSuccess: true, status: AddBuildingStatus.successfullyAdded);
}

class BuildingBackendResponse {
  final bool isSuccess;

  final List<BuildingBackendModel>? buildingList;

  BuildingBackendResponse({required this.isSuccess, required this.buildingList});
}

class BuildingBackendModel {
  late int id;
  late String name;
  late bool active;

  BuildingBackendModel({
    required this.id,
    required this.name,
    required this.active,
  });

  BuildingBackendModel.fromJson(Map<String, dynamic> json) {
    id = json["building_id"];
    name = json["building_name"];
    active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["building_id"] = id;
    data["building_name"] = name;
    data["active"] = active;
    return data;
  }
}

class AddBuildingBackendResponse {
  final bool isSuccess;

  final AddBuildingStatus status;

  AddBuildingBackendResponse({required this.isSuccess, required this.status});
}

enum AddBuildingStatus {
  buildingAlradyExist,
  successfullyAdded,
}
