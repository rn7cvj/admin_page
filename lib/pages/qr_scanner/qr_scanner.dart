import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/widgets.dart';

class QrScanner extends StatelessWidget {
  const QrScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return AiBarcodeScanner(
      validator: (String value) {
        if (value.startsWith('http')) {
          return true;
        }
        return false;
      },
      onScan: (String value) {
        debugPrint(value);
      },
      hintWidget: Container(),
    );
  }
}
