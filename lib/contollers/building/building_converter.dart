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
