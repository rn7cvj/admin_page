// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../shared/models/user_data/user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['id'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      thirdName: json['third_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      birthday: DateTime.parse(json['birthdate'] as String),
      gender: $enumDecode(_$GenderEnumMap, json['gender'],
          unknownValue: Gender.unknow),
      photos:
          (json['photo'] as List<dynamic>?)?.map((e) => e as String).toList(),
      phoneNumber: json['phone_number'] as String,
      telegramId: json['telegram_id'] as String?,
      verified: json['verified'] as bool,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'third_name': instance.thirdName,
      'email': instance.email,
      'birthdate': instance.birthday.toIso8601String(),
      'gender': _$GenderEnumMap[instance.gender]!,
      'photo': instance.photos,
      'phone_number': instance.phoneNumber,
      'telegram_id': instance.telegramId,
      'verified': instance.verified,
    };

const _$GenderEnumMap = {
  Gender.male: 'm',
  Gender.female: 'f',
  Gender.unknow: 'unknow',
};
