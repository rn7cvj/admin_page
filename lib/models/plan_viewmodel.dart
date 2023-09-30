class PlanViewModel {
  int? planId;
  String? serviceName;
  int? planTypeCost;
  int? planCapacity;
  String? planStatus;

  PlanViewModel({this.planId, this.serviceName, this.planTypeCost, this.planCapacity, this.planStatus});

  PlanViewModel.fromJson(Map<String, dynamic> json) {
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
