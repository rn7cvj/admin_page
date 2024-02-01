import 'dart:convert';

import 'package:admin_page/shared/controllers/network/service_provider.dart';
import 'package:admin_page/shared/controllers/user_data/service.dart';
import 'package:admin_page/shared/logger.dart';
import 'package:admin_page/shared/models/user_data/user_data.dart';

class UserDataConverter {
  static Future<UserDataResponse> getUserData() async {
    UserDataBackendResponse? backendResponse;

    try {
      backendResponse =
          await ServiceProvide.get<UserDataService>().getUserData();
    } catch (ex) {
      return UserDataResponse(status: UserDataResponseStatus.newtworkTrouble);
    }

    if (!backendResponse.isSuccess) {
      return UserDataResponse(
        status: UserDataResponseStatus.serverInaccessible,
      );
    }

    UserData userData = UserData.fromJson(backendResponse.data!);

    const jsonEncoder = JsonEncoder.withIndent('    ');

    logger.i("Loadded user data: ${jsonEncoder.convert(userData.toJson())}");

    return UserDataResponse(
      status: UserDataResponseStatus.success,
      userData: userData,
    );
  }
}

class UserDataResponse {
  final UserDataResponseStatus status;

  final UserData? userData;

  UserDataResponse({required this.status, this.userData});
}

enum UserDataResponseStatus {
  newtworkTrouble,
  serverInaccessible,

  success,
}
