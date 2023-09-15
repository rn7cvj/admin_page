class EventViewModel {
  final int? id;
  final String? eventName;
  final String? beginTime;
  final String? endTime;
  final String? coachPhoneNumber;
  final String? coachEmail;
  final String? buildingName;
  final int? totalSpaces;
  final int? occupiedSpaces;
  final String? areaName;
  final bool? active;
  final String? coachName;

  EventViewModel(
      {required this.id,
      required this.eventName,
      required this.beginTime,
      required this.endTime,
      required this.coachPhoneNumber,
      required this.coachEmail,
      required this.buildingName,
      required this.totalSpaces,
      required this.occupiedSpaces,
      required this.areaName,
      required this.active,
      required this.coachName});
}
