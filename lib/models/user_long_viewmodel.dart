class UserDataLongViewModel {
  String? firstName;
  String? secondName;
  String? thirdName;
  String? email;
  String? type;
  String? birthdate;
  String? gender;
  String? status;
  List<String>? photo;
  String? phoneNumber;
  String? telegramId;
  bool? verified;
  bool? active;

  UserDataLongViewModel(
      {this.firstName,
      this.secondName,
      this.thirdName,
      this.email,
      this.type,
      this.birthdate,
      this.gender,
      this.status,
      this.photo,
      this.phoneNumber,
      this.telegramId,
      this.verified,
      this.active});

  UserDataLongViewModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    secondName = json['second_name'];
    thirdName = json['third_name'];
    email = json['email'];
    type = json['type'];
    birthdate = json['birthdate'];
    gender = json['gender'];
    status = json['status'];
    photo = <String>[];
    json['photo'].forEach((v) {
      photo!.add(v);
    });
    phoneNumber = json['phone_number'];
    telegramId = json['telegram_id'];
    verified = json['verified'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['second_name'] = this.secondName;
    data['third_name'] = this.thirdName;
    data['email'] = this.email;
    data['type'] = this.type;
    data['birthdate'] = this.birthdate;
    data['gender'] = this.gender;
    data['status'] = this.status;
    data['photo'] = this.photo;
    data['phone_number'] = this.phoneNumber;
    data['telegram_id'] = this.telegramId;
    data['verified'] = this.verified;
    data['active'] = this.active;
    return data;
  }
}
