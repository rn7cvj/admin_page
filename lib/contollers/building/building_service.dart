import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
part '../../gen/contollers/building/building_service.chopper.dart';

@ChopperApi()
abstract class BuildingService extends ChopperService {
  Future<BuildingBackendResponse> getBuilding() async {
    Response res = (await _getBuilding("admin_panel"));

    return converResponse(res);
  }

  @Get(path: "/building/view")
  Future<Response> _getBuilding(@Query("screen") screen);

  static BuildingService create([ChopperClient? client]) => _$BuildingService(client);
}

FutureOr<BuildingBackendResponse> converResponse(Response res) {
  if (!res.isSuccessful) {
    return BuildingBackendResponse(isSuccess: false, buildingList: null);
  }

  String jsonBody = const Utf8Decoder().convert(res.bodyBytes);
  List<dynamic> json = jsonDecode(jsonBody);

  List<BuildingBackendModel> buildingList = [];

  buildingList = json.map((e) => BuildingBackendModel.fromJson(e)).toList();

  return BuildingBackendResponse(isSuccess: true, buildingList: buildingList);
}

class BuildingBackendResponse {
  final bool isSuccess;

  final List<BuildingBackendModel>? buildingList;

  BuildingBackendResponse({required this.isSuccess, required this.buildingList});
}

class BuildingBackendModel {
  late int id;
  late String name;

  BuildingBackendModel({
    required this.id,
    required this.name,
  });

  BuildingBackendModel.fromJson(Map<String, dynamic> json) {
    id = json["building_id"];
    name = json["building_name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["building_id"] = id;
    data["building_name"] = name;
    return data;
  }
}
