import 'package:admin_page/contollers/plan/plan_convertor.dart';
import 'package:admin_page/contollers/plan/plan_service.dart';
import 'package:admin_page/logger.dart';
import 'package:admin_page/models/plan_viewmodel.dart';
import 'package:mobx/mobx.dart';

part '../../gen/contollers/plan/plan_controller.g.dart';

class PlanContoroller = BookingControllerStore with _$PlanContoroller;

abstract class BookingControllerStore with Store {
  BookingControllerStore({required this.planConvertor});
  final PlanConvertor planConvertor;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<PlanViewModel> plans = <PlanViewModel>[].asObservable();

  @action
  Future<void> getPlans(String userId) async {
    isLoading = true;

    PlanResponse res = await planConvertor.getPlans(userId);

    logger.i(res.status);

    if (res.status != PlanResponseStatus.success) {
      isLoading = false;
    }

    plans = convertResponse(res.plans!).toList().asObservable();

    isLoading = false;
  }

  @action
  Future<void> activatePlan(String userId, String planId) async {
    isLoading = true;

    await planConvertor.activatePlan(planId);

    await getPlans(userId);
    isLoading = false;
  }

  @action
  Future<void> deactivatePlan(String userId, String planId) async {
    isLoading = true;

    await planConvertor.deactivatePlan(planId);

    await getPlans(userId);
    isLoading = false;
  }

  Iterable<PlanViewModel> convertResponse(List<PlanBackendModel> plans) sync* {
    for (PlanBackendModel plan in plans) {
      yield PlanViewModel(
        planId: plan.planId,
        serviceName: plan.serviceName,
        planCapacity: plan.planCapacity,
        planStatus: plan.planStatus,
        planTypeCost: plan.planTypeCost,
      );
    }
  }
}
