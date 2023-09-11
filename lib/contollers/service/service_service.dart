import 'dart:async';

import 'package:chopper/chopper.dart';
import 'dart:convert';

part '../../gen/contollers/service/service_service.chopper.dart';

@ChopperApi()
abstract class ServiceService extends ChopperService {
  Future<ServiceBackendResponse> getPlan() async {
    Response res = await _getPlan("admin_panel");
    return converResponse(res);
  }

  @Get(path: "/plan/view")
  Future<Response> _getPlan(@Query("screen") screen);

  static ServiceService create([ChopperClient? client]) => _$ServiceService(client);
}

FutureOr<ServiceBackendResponse> converResponse(Response res) {
  if (!res.isSuccessful) {
    ServiceBackendResponse response = ServiceBackendResponse();
    response.isSuccess = false;
    return response;
  }

  String jsonBody = const Utf8Decoder().convert(res.bodyBytes);
  List<dynamic> json = jsonDecode(jsonBody);

  // List<PersonBackendModel> personList = json.map((e) => PersonBackendModel.fromJson(e)).toList();

  ServiceBackendResponse response = ServiceBackendResponse();
  response.isSuccess = true;
  response.categoryList = json.map((e) => CategoryBackendResponse.fromJson(e)).toList();

  return response;
}

class ServiceBackendResponse {
  late bool isSuccess;

  List<CategoryBackendResponse>? categoryList;
}

class CategoryBackendResponse {
  late int categoryId;
  late String categoryName;
  late bool active;
  late List<String> categoryPhoto;
  late List<ServiceTempBackendResponse> services;

  CategoryBackendResponse({
    required this.categoryId,
    required this.categoryName,
    required this.active,
    required this.categoryPhoto,
  });

  CategoryBackendResponse.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    active = json['active'];

    categoryPhoto = <String>[];
    json['category_photo'].forEach((v) {
      categoryPhoto.add(v);
    });

    services = <ServiceTempBackendResponse>[];

    json["services"].forEach((e) {
      services.add(ServiceTempBackendResponse.fromJson(e));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['active'] = active;
    data['category_photo'] = categoryPhoto;
    data["services"] = services.map((e) => e.toJson()).toList();
    return data;
  }
}

class ServiceTempBackendResponse {
  late int serviceId;
  late String serviceName;
  late String serviceDescription;
  late bool active;
  late List<String> servicePhoto;
  // late List<String> plans;

  ServiceTempBackendResponse({
    required this.serviceId,
    required this.serviceName,
    required this.serviceDescription,
    required this.active,
    required this.servicePhoto,
    // required this.plans,
  });

  ServiceTempBackendResponse.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    serviceDescription = json['service_description'];
    active = json['active'];
    if (json['service_photo'] != null) {
      servicePhoto = <String>[];
      json['service_photo'].forEach((v) {
        servicePhoto.add(v);
      });
    }
    // if (json['plans'] != null) {
    //   plans = <String>[];
    //   json['plans'].forEach((v) {
    //     plans!.add(v);
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_id'] = serviceId;
    data['service_name'] = serviceName;
    data['service_description'] = serviceDescription;
    data['active'] = active;
    data['service_photo'] = servicePhoto.map((v) => v).toList();
    // data['plans'] = plans.map((v) => v).toList();
    return data;
  }
}
