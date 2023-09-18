import 'package:admin_page/contollers/user_data/user_data_service.dart';

class UserDataConverter {
  final UserDataService scannedPersonService;

  UserDataConverter({required this.scannedPersonService});

  Future<UserDataResponse> getUserData(String userId) async {
    UserDataLongBackendResponse? backendResponse;

    try {
      backendResponse = await scannedPersonService.getUserData(userId);
    } catch (ex) {
      return UserDataResponse()..status = UserDataResponseStatus.networkTrouble;
    }

    if (!backendResponse.isSuccess) {
      return UserDataResponse()..status = UserDataResponseStatus.networkTrouble;
    }

    return UserDataResponse()
      ..status = UserDataResponseStatus.success
      ..data = backendResponse.userData;
  }
}

class UserDataResponse {
  late UserDataResponseStatus status;

  UserDataLongBackendModel? data;
}

enum UserDataResponseStatus {
  networkTrouble,
  success,
}
