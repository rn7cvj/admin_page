import 'package:admin_page/gen/i18n/strings.g.dart';
import 'package:admin_page/shared/controllers/di/manager.dart';
import 'package:admin_page/shared/controllers/user_data/controller.dart';
import 'package:fefufit_uikit/fefufit_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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

  void _showQrScanneBotomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 200,
        child: Center(
          child: Text('QR Scanner'),
        ),
      ),
    );
  }
}
