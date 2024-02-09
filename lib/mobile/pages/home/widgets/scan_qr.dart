import 'package:admin_page/gen/i18n/strings.g.dart';
import 'package:admin_page/mobile/main.dart';
import 'package:admin_page/mobile/navigation/navigator.dart';
import 'package:admin_page/mobile/navigation/router.dart';
import 'package:admin_page/mobile/pages/scanned_person/scanned_person.dart';
import 'package:admin_page/shared/controllers/di/manager.dart';
import 'package:admin_page/shared/controllers/user_data/controller.dart';
import 'package:admin_page/shared/logger.dart';
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:fefufit_uikit/fefufit_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

class ScanQr extends StatelessWidget {
  ScanQr({super.key});

  final UserDataController controller = DIManager.get<UserDataController>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) {
          bool isEnable =
              controller.state == UserDataControllerState.successfullyLoad;
          return FFMinorButton(
            text: t.home.scan_qr,
            onTap: () => _showQrScanneBotomSheet(context),
            isLoading: !isEnable,
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: context.ffTheme.color.onMinorControllColor,
            ),
          );
        },
      );

  void _showQrScanneBotomSheet(BuildContext context) => showModalBottomSheet(
        context: rootNavigatorKey.currentContext!,
        backgroundColor: context.ffTheme.color.mainBackgoundColor,
        isScrollControlled: true,
        builder: (context) => SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: ffPaddingMedium),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(ffBorderRadiusMedium),
                        child: AiBarcodeScanner(
                          allowDuplicates: false,
                          borderRadius: ffBorderRadiusMedium,
                          validator: _validator,
                          onScan: _onScan,
                          canPop: false,
                          showError: false,
                          showSuccess: false,
                          hintWidget: Container(),
                          controller: MobileScannerController(
                            detectionSpeed: DetectionSpeed.normal,
                            detectionTimeoutMs: 1500,
                            useNewCameraSelector: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                FFMinorButton(
                  text: t.common.close,
                  onTap: rootNavigatorKey.currentContext!.pop,
                ),
                SizedBox(
                  height:
                      MediaQuery.of(context).padding.bottom + ffPaddingMedium,
                )
              ],
            ),
          ),
        ),
      );

  bool _validator(String qrCode) {
    if (qrCode.startsWith('ff://') && (qrCode.length > 6)) return true;

    return false;
  }

  void _onScan(String qrCode) {
    logger.i("Scanned QR: $qrCode");
    rootNavigatorKey.currentContext!.pop();
    Future.delayed(const Duration(milliseconds: 300), () {
      _openScannerBottomSheet(
          rootNavigatorKey.currentContext!, qrCode.substring(5));
    });
  }

  void _openScannerBottomSheet(BuildContext context, String token) =>
      showModalBottomSheet(
        context: rootNavigatorKey.currentContext!,
        backgroundColor: context.ffTheme.color.mainBackgoundColor,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (context) => SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.8,
          child: ScannedPerson(token: token),
        ),
      );
}
