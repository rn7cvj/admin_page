import 'dart:async';

import 'package:chopper/chopper.dart';
import 'dart:convert';

part '../../gen/contollers/plan/plan_service.chopper.dart';

@ChopperApi()
abstract class PlanService extends ChopperService {
  Future<PlanBackendResponse> getPlans(String userId) async {
    Response res = (await _getPlans("qr", userId));

    return convertResponse(res);
  }

  Future<void> activatePlan(String planId) async {
    await _activatePlan(planId);
  }

  Future<void> deactivatePlan(String planId) async {
    await _deactivatePlan(planId);
  }

  @Get(path: "/plan/view")
  Future<Response> _getPlans(@Query("screen") screen, @Query("user_id") userId);

  @Post(path: "plan/activate")
  Future<Response> _activatePlan(@Query("plan_id") planId);

  @Post(path: "plan/deactivate")
  Future<Response> _deactivatePlan(@Query("plan_id") planId);

  static PlanService create([ChopperClient? client]) => _$PlanService(client);
}

FutureOr<PlanBackendResponse> convertResponse(Response res) {
  if (!res.isSuccessful) {
    return PlanBackendResponse()..isSuccess = false;
  }

  String jsonBody = const Utf8Decoder().convert(res.bodyBytes);
  List<dynamic> json = jsonDecode(jsonBody);

  PlanBackendResponse response = PlanBackendResponse();
  response.isSuccess = true;
  response.plans = json.map((e) => PlanBackendModel.fromJson(e)).toList();

  return response;
}

class PlanBackendResponse {
  late bool isSuccess;

  List<PlanBackendModel>? plans;
}

class PlanBackendModel {
  int? planId;
  String? serviceName;
  int? planTypeCost;
  int? planCapacity;
  String? planStatus;

  PlanBackendModel({this.planId, this.serviceName, this.planTypeCost, this.planCapacity, this.planStatus});

  PlanBackendModel.fromJson(Map<String, dynamic> json) {
    planId = json['plan_id'];
    serviceName = json['service_name'];
    planTypeCost = json['plan_type_cost'];
    planCapacity = json['plan_capacity'];
    planStatus = json['plan_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan_id'] = this.planId;
    data['service_name'] = this.serviceName;
    data['plan_type_cost'] = this.planTypeCost;
    data['plan_capacity'] = this.planCapacity;
    data['plan_status'] = this.planStatus;
    return data;
  }
}
