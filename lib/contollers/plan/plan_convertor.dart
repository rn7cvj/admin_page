import 'package:admin_page/contollers/plan/plan_service.dart';

class PlanConvertor {
  PlanConvertor({required PlanService planService}) : _planService = planService;

  final PlanService _planService;

  Future<PlanResponse> getPlans(String userId) async {
    PlanBackendResponse? backendResponse;

    try {
      backendResponse = await _planService.getPlans(userId);
    } catch (e) {
      return PlanResponse()..status = PlanResponseStatus.networkTrouble;
    }

    if (!backendResponse.isSuccess) {
      return PlanResponse()..status = PlanResponseStatus.networkTrouble;
    }

    return PlanResponse()
      ..status = PlanResponseStatus.success
      ..plans = backendResponse.plans;
  }

  Future<void> activatePlan(String planId) async {
    try {
      await _planService.activatePlan(planId);
    } catch (ex) {}
  }

  Future<void> deactivatePlan(String planId) async {
    try {
      await _planService.deactivatePlan(planId);
    } catch (ex) {}
  }
}

class PlanResponse {
  late PlanResponseStatus status;

  List<PlanBackendModel>? plans;
}

enum PlanResponseStatus {
  networkTrouble,
  success,
}
