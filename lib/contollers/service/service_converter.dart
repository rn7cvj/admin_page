import 'package:admin_page/contollers/service/service_service.dart';

class ServiceConverter {
  ServiceConverter({required this.serviceService});

  final ServiceService serviceService;

  Future<ServiceResponse> getPlan() async {
    ServiceBackendResponse? backendResponse;

    try {
      backendResponse = await serviceService.getPlan();
    } catch (ex) {
      return ServiceResponse(
        status: ServiceResponseStatus.networkTrouble,
        categoryList: null,
      );
    }

    if (!backendResponse.isSuccess) {
      return ServiceResponse(
        status: ServiceResponseStatus.networkTrouble,
        categoryList: null,
      );
    }

    return ServiceResponse(
      status: ServiceResponseStatus.success,
      categoryList: backendResponse.categoryList,
    );
  }
}

class ServiceResponse {
  final ServiceResponseStatus status;

  final List<CategoryBackendResponse>? categoryList;

  ServiceResponse({required this.status, required this.categoryList});
}

enum ServiceResponseStatus {
  networkTrouble,
  success,
}
