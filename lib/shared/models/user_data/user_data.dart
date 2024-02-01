import 'package:json_annotation/json_annotation.dart';
part '../../../gen/shared/models/user_data/user_data.g.dart';

@JsonSerializable()
class UserData {
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  @JsonKey(name: 'first_name', defaultValue: '')
  final String firstName;
  @JsonKey(name: 'last_name', defaultValue: '')
  final String lastName;
  @JsonKey(name: "third_name", defaultValue: '')
  final String thirdName;
  @JsonKey(name: 'email', defaultValue: '')
  final String email;
  @JsonKey(name: 'birthdate')
  final DateTime birthday;
  @JsonKey(name: "gender", unknownEnumValue: Gender.unknow)
  final Gender gender;
  @JsonKey(name: 'photo')
  final List<String>? photos;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'telegram_id')
  final String? telegramId;
  @JsonKey(name: 'verified')
  final bool verified;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  UserData(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.thirdName,
      required this.email,
      required this.birthday,
      required this.gender,
      required this.photos,
      required this.phoneNumber,
      required this.telegramId,
      required this.verified});
}

enum Gender {
  @JsonValue('m')
  male,
  @JsonValue('f')
  female,
  unknow
}
