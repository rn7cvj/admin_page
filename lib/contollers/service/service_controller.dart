import 'package:admin_page/contollers/service/service_converter.dart';
import 'package:admin_page/contollers/service/service_service.dart';
import 'package:admin_page/logger.dart';
import 'package:admin_page/models/category_viewmodel.dart';
import 'package:admin_page/models/service_viewmodel.dart';
import 'package:mobx/mobx.dart';

part '../../gen/contollers/service/service_controller.g.dart';

class ServiceController = ServiceControllerStore with _$ServiceController;

abstract class ServiceControllerStore with Store {
  ServiceControllerStore({required this.serviceConverter});

  final ServiceConverter serviceConverter;

  @observable
  bool isLoading = true;

  @observable
  ObservableList<CategoryViewModel> categories = <CategoryViewModel>[].asObservable();

  @action
  Future<void> init() async {
    isLoading = true;

    ServiceResponse response = await serviceConverter.getPlan();

    logger.i(response.status);

    if (response.status != ServiceResponseStatus.success) return;

    for (CategoryBackendResponse category in response.categoryList!) {
      categories.add(convertResponse(category));
    }

    isLoading = false;
  }

  CategoryViewModel convertResponse(CategoryBackendResponse category) {
    List<ServiceViewModel> services = [];

    for (var service in category.services) {
      services.add(ServiceViewModel(
        id: service.serviceId,
        name: service.serviceName,
      ));
    }

    CategoryViewModel response = CategoryViewModel(
        id: category.categoryId,
        name: category.categoryName,
        active: category.active,
        photos: category.categoryPhoto,
        services: services);

    return response;
  }
}
