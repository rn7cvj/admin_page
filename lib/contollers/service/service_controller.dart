import 'package:admin_page/contollers/service/service_converter.dart';
import 'package:admin_page/logger.dart';
import 'package:mobx/mobx.dart';

part '../../gen/contollers/service/service_controller.g.dart';

class ServiceController = ServiceControllerStore with _$ServiceController;

abstract class ServiceControllerStore with Store {
  ServiceControllerStore({required this.serviceConverter});

  final ServiceConverter serviceConverter;

  Future<void> init() async {
    ServiceResponse response = await serviceConverter.getPlan();

    logger.i(response.status);

    if (response.status != ServiceResponseStatus.success) return;

    for (var category in response.categoryList!) {
      logger.i(category.runtimeType);
      logger.i(category.toJson());
    }
  }
}
