import 'package:admin_page/contollers/scanned/scanned_controller.dart';
import 'package:admin_page/i18n/strings.g.dart';
import 'package:admin_page/navigation/navigator.dart';
import 'package:admin_page/pages/scanned_person/widgets/person_page.dart';
import 'package:admin_page/pages/services/widgets/actions_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScannedPerson extends StatelessWidget {
  ScannedPerson({super.key, required this.qrToken});

  final String qrToken;

  final ScannedController controller = GetIt.I<ScannedController>();

  @override
  Widget build(BuildContext context) {
    controller.scanQr(qrToken);

    return Observer(
      builder: (context) {
        if (controller.isScanning) {
          return Center(
            child: LoadingAnimationWidget.prograssiveDots(color: Color.fromRGBO(67, 67, 244, 1), size: 60),
          );
        }

        if (controller.scannedResultStatus == ScannedResultStatus.tokendInvalid) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  t.scanned.qr_invalid,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              ActionButton(
                lable: t.scanned.back_to_camera,
                icon: Icon(Icons.qr_code_scanner_outlined),
                onPressed: AppNavigator.goScanner,
              )
            ],
          );
        }

        return PersonScannedPage(scannedUserId: controller.userId);
      },
    );
  }
}
