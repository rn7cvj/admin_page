import 'package:admin_page/contollers/building/building_service.dart';

class BuildingConverter {
  final BuildingService buildingService;

  BuildingConverter({required this.buildingService});

  Future<BuildingResponse> getBuildings() async {
    BuildingBackendResponse? backendResponse;
    try {
      backendResponse = await buildingService.getBuilding();
    } catch (ex) {
      return BuildingResponse(
        status: BuildingResponseStatus.networkTrouble,
        buildingsList: null,
      );
    }

    if (!backendResponse.isSuccess) {
      return BuildingResponse(
        status: BuildingResponseStatus.networkTrouble,
        buildingsList: null,
      );
    }

    return BuildingResponse(
      status: BuildingResponseStatus.success,
      buildingsList: backendResponse.buildingList,
    );
  }

  Future<AddBuildingResponse> addBuidling(String buildingName) async {
    AddBuildingBackendResponse? backendResponse;
    try {
      backendResponse = await buildingService.addBuidling(buildingName);
    } catch (ex) {
      return AddBuildingResponse(
        status: AddBuildingResponseStatus.networkTrouble,
      );
    }

    if (!backendResponse.isSuccess) {
      return AddBuildingResponse(
        status: AddBuildingResponseStatus.networkTrouble,
      );
    }

    if (backendResponse.status == AddBuildingStatus.buildingAlradyExist) {
      return AddBuildingResponse(
        status: AddBuildingResponseStatus.buildingAlradyExist,
      );
    }

    return AddBuildingResponse(
      status: AddBuildingResponseStatus.success,
    );
  }

  Future<void> deleteBuiding(int buildingId) async {
    try {
      await buildingService.deleteBuidling(buildingId);
    } catch (ex) {}
  }

  Future<void> activateBuilding(int buildingId, String buildingName) async {
    try {
      await buildingService.activateBuilding(buildingId, buildingName);
    } catch (ex) {}
  }
}

class BuildingResponse {
  final BuildingResponseStatus status;

  final List<BuildingBackendModel>? buildingsList;

  BuildingResponse({required this.status, required this.buildingsList});
}

enum BuildingResponseStatus {
  networkTrouble,
  success,
}

class AddBuildingResponse {
  final AddBuildingResponseStatus status;

  AddBuildingResponse({required this.status});
}

enum AddBuildingResponseStatus {
  networkTrouble,
  buildingAlradyExist,
  success,
}
