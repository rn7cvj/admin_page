import 'package:admin_page/contollers/scanned/scanned_converter.dart';
import 'package:admin_page/logger.dart';
import 'package:mobx/mobx.dart';

part '../../gen/contollers/scanned/scanned_controller.g.dart';

class ScannedController = ScannedContollerStore with _$ScannedController;

abstract class ScannedContollerStore with Store {
  final ScannedConverter scannedConverter;

  ScannedContollerStore({required this.scannedConverter});

  @observable
  bool isScanning = true;

  @observable
  ScannedResultStatus? scannedResultStatus;

  @observable
  String userId = "";

  @action
  Future<void> scanQr(String qrToken) async {
    isScanning = true;
    scannedResultStatus = null;

    ScannedTokenResponse response = await scannedConverter.scanQr(qrToken);

    logger.i(response.status);

    if (response.status != ScannedTokenResponseStatus.success) {
      scannedResultStatus = ScannedResultStatus.tokendInvalid;
      isScanning = false;

      return;
    }

    userId = response.userId!;
    scannedResultStatus = ScannedResultStatus.tokenValid;

    isScanning = false;
  }
}

enum ScannedResultStatus {
  tokendInvalid,
  tokenValid,
}
