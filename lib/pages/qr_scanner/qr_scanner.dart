import 'package:admin_page/logger.dart';
import 'package:admin_page/navigation/navigator.dart';
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class QrScanner extends StatelessWidget {
  const QrScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return AiBarcodeScanner(
      allowDuplicates: false,
      showError: false,
      showSuccess: false,
      successColor: const Color.fromRGBO(67, 67, 244, 0.4),
      validator: (value) {
        logger.i("Validate token $value");
        if (value.startsWith('ff://')) return true;

        Widget snackBarContent = Card(
          color: const Color.fromRGBO(67, 67, 244, 1),
          elevation: 5,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              "Token Invalid",
              style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white),
            )),
          ),
        );

        showTopSnackBar(
          Overlay.of(context),
          snackBarContent,
          dismissType: DismissType.onSwipe,
          snackBarPosition: SnackBarPosition.top,
          dismissDirection: [DismissDirection.none],
        );

        return false;
      },
      // canPop: false,
      onScan: (String value) {
        logger.i("Scan token $value");
        AppNavigator.goScannedPeron(value.substring(5));
      },
      hintWidget: Container(),
      controller: MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
        // detectionTimeoutMs: 1500,
      ),
    );
  }
}
