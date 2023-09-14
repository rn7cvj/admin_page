import 'dart:async';

import 'package:admin_page/contollers/building/building_converter.dart';
import 'package:admin_page/contollers/building/building_service.dart';
import 'package:admin_page/logger.dart';
import 'package:admin_page/models/building_viewmodel.dart';
import 'package:mobx/mobx.dart';

part '../../gen/contollers/building/building_contoller.g.dart';

class BuildingController = BuildingControllerStore with _$BuildingController;

abstract class BuildingControllerStore with Store {
  BuildingControllerStore({required this.buildingConverter});
  final BuildingConverter buildingConverter;

  @observable
  bool isLoading = true;

  @observable
  ObservableList<BuildingViewModel> buildings = <BuildingViewModel>[].asObservable();

  @action
  Future<void> init() async {
    isLoading = true;

    BuildingResponse response = await buildingConverter.getBuildings();

    logger.i(response.status);

    if (response.status != BuildingResponseStatus.success) return;

    buildings.clear();

    for (BuildingBackendModel building in response.buildingsList!) {
      buildings.add(convertResponse(building));
    }

    buildings.sort((BuildingViewModel a, BuildingViewModel b) => (b.isActive ? 1 : 0).compareTo(a.isActive ? 1 : 0));

    isLoading = false;
  }

  BuildingViewModel convertResponse(BuildingBackendModel building) {
    return BuildingViewModel(id: building.id, name: building.name, isActive: building.active);
  }

  StreamController<AddBuildingMessage> addBuidlingMessageStream = StreamController<AddBuildingMessage>.broadcast();

  @observable
  bool isBuildingAdding = false;

  @observable
  bool isBuidlingEditing = false;

  @action
  void switchEditingMod() => isBuidlingEditing = !isBuidlingEditing;

  @action
  Future<void> addBuidling(String buildingName) async {
    isBuildingAdding = true;

    AddBuildingResponse response = await buildingConverter.addBuidling(buildingName);

    handelAddBuidlingMessage(response);
    logger.i(response.status);

    if (response.status == AddBuildingResponseStatus.success) {
      init();
    }

    isBuildingAdding = false;
  }

  void handelAddBuidlingMessage(AddBuildingResponse response) {
    if (response.status == AddBuildingResponseStatus.success) {
      addBuidlingMessageStream.add(AddBuildingMessage(info: AbbBuildingMessageInfo.buildingAddSuccessfully));
    }
    if (response.status == AddBuildingResponseStatus.networkTrouble) {
      addBuidlingMessageStream.add(AddBuildingMessage(info: AbbBuildingMessageInfo.networkTrouble));
    }
    if (response.status == AddBuildingResponseStatus.buildingAlradyExist) {
      addBuidlingMessageStream.add(AddBuildingMessage(info: AbbBuildingMessageInfo.buildingAlradyExist));
    }
  }

  @action
  Future<void> deactiveteBuilding(int buildingId) async {
    isLoading = true;
    await buildingConverter.deleteBuiding(buildingId);
    init();
  }

  @action
  Future<void> activateBuilding(int buildingId, String buildingName) async {
    isLoading = true;
    await buildingConverter.activateBuilding(buildingId, buildingName);
    init();
  }
}

class AddBuildingMessage {
  final AbbBuildingMessageInfo info;

  AddBuildingMessage({required this.info});
}

enum AbbBuildingMessageInfo {
  buildingAddSuccessfully,
  networkTrouble,
  buildingAlradyExist,
}
