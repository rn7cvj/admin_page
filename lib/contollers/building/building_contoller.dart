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

    for (BuildingBackendModel building in response.buildingsList!) {
      buildings.add(convertResponse(building));
    }

    isLoading = false;
  }

  BuildingViewModel convertResponse(BuildingBackendModel building) {
    return BuildingViewModel(id: building.id, name: building.name);
  }
}
