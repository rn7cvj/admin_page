import 'package:admin_page/contollers/scanned_person/scanned_person_service.dart';

class ScannedPersonConverter {
  final ScannedPersonService scannedPersonService;

  ScannedPersonConverter({required this.scannedPersonService});

  Future<ScannedPersonResponse> getUserData(String userId) async {
    UserDataLongBackendResponse? backendResponse;

    try {
      backendResponse = await scannedPersonService.getUserData(userId);
    } catch (ex) {
      return ScannedPersonResponse()..status = ScannedPersonResponseStatus.networkTrouble;
    }

    if (!backendResponse.isSuccess) {
      return ScannedPersonResponse()..status = ScannedPersonResponseStatus.networkTrouble;
    }

    return ScannedPersonResponse()
      ..status = ScannedPersonResponseStatus.success
      ..data = backendResponse.userData;
  }
}

class ScannedPersonResponse {
  late ScannedPersonResponseStatus status;

  UserDataLongBackendModel? data;
}

enum ScannedPersonResponseStatus {
  networkTrouble,
  success,
}
