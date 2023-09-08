class PersonViewModel {
  int? id;
  String? gender;
  String? birthdate;
  String? status;
  String? phoneNumber;
  String? email;
  String? type;
  String? name;
  String? lastVisit;

  PersonViewModel(
      {this.id,
      this.gender,
      this.birthdate,
      this.status,
      this.phoneNumber,
      this.email,
      this.type,
      this.name,
      this.lastVisit});

  PersonViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    status = json['status'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    type = json['type'];
    name = json['name'];
    lastVisit = json['last_visit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['status'] = status;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['type'] = type;
    data['name'] = name;
    data['last_visit'] = lastVisit;
    return data;
  }
}
