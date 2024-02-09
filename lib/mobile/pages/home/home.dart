import 'package:admin_page/gen/i18n/strings.g.dart';
import 'package:admin_page/mobile/pages/home/widgets/appbar.dart';
import 'package:admin_page/mobile/pages/home/widgets/qr_token_button.dart';
import 'package:admin_page/mobile/pages/home/widgets/scan_qr.dart';
import 'package:admin_page/shared/controllers/di/manager.dart';
import 'package:admin_page/shared/controllers/user_data/controller.dart';
import 'package:fefufit_uikit/fefufit_uikit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final UserDataController controller = DIManager.get<UserDataController>();

  @override
  Widget build(BuildContext context) {
    controller.init();
    return RefreshIndicator(
      onRefresh: controller.getUserData,
      color: context.ffTheme.color.onMinorControllColor,
      backgroundColor: context.ffTheme.color.minorControllColor,
      child: ListView(
        padding: const EdgeInsets.only(
          left: ffPaddingMedium,
          right: ffPaddingMedium,
          top: ffPaddingLarge,
        ),
        children: [
          HomeAppBar(),
          SizedBox(height: ffPaddingMedium),
          QrToken(),
          SizedBox(height: ffPaddingMedium),
          ScanQr(),
        ],
      ),
    );
  }
}
