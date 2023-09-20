class BookingViewModel {
  int? id;
  String? eventName;
  String? beginTime;
  String? endTime;
  String? coachPhoneNumber;
  String? coachEmail;
  String? buildingName;
  int? totalSpaces;
  int? occupiedSpaces;
  String? areaName;
  bool? visibility;
  String? coachName;
  String? status;

  BookingViewModel(
      {this.id,
      this.eventName,
      this.beginTime,
      this.endTime,
      this.coachPhoneNumber,
      this.coachEmail,
      this.buildingName,
      this.totalSpaces,
      this.occupiedSpaces,
      this.areaName,
      this.visibility,
      this.coachName,
      this.status});

  BookingViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventName = json['event_name'];
    beginTime = json['begin_time'];
    endTime = json['end_time'];
    coachPhoneNumber = json['coach_phone_number'];
    coachEmail = json['coach_email'];
    buildingName = json['building_name'];
    totalSpaces = json['total_spaces'];
    occupiedSpaces = json['occupied_spaces'];
    areaName = json['area_name'];
    visibility = json['visibility'];
    coachName = json['coach_name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['event_name'] = this.eventName;
    data['begin_time'] = this.beginTime;
    data['end_time'] = this.endTime;
    data['coach_phone_number'] = this.coachPhoneNumber;
    data['coach_email'] = this.coachEmail;
    data['building_name'] = this.buildingName;
    data['total_spaces'] = this.totalSpaces;
    data['occupied_spaces'] = this.occupiedSpaces;
    data['area_name'] = this.areaName;
    data['visibility'] = this.visibility;
    data['coach_name'] = this.coachName;
    data['status'] = this.status;
    return data;
  }
}
