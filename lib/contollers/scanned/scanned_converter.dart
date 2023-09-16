import 'package:admin_page/contollers/scanned/scanned_service.dart';
import 'package:admin_page/logger.dart';

class ScannedConverter {
  final ScannedService scannedService;

  ScannedConverter({required this.scannedService});

  Future<ScannedTokenResponse> scanQr(String qrToken) async {
    ScanTokenBackendResponse? backendResponse;

    try {
      backendResponse = await scannedService.scanQr(qrToken);
    } catch (ex) {
      return ScannedTokenResponse()..status = ScannedTokenResponseStatus.networkTrouble;
    }

    if (!backendResponse.isSuccess) {
      return ScannedTokenResponse()..status = ScannedTokenResponseStatus.networkTrouble;
    }

    return ScannedTokenResponse()
      ..status = ScannedTokenResponseStatus.success
      ..userId = backendResponse.userId;
  }
}

class ScannedTokenResponse {
  late ScannedTokenResponseStatus status;

  String? userId;
}

enum ScannedTokenResponseStatus { networkTrouble, success }
