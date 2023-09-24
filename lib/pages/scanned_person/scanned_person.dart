import 'package:admin_page/contollers/scanned/scanned_controller.dart';
import 'package:admin_page/contollers/scanned/scanned_converter.dart';
import 'package:admin_page/contollers/scanned/scanned_service.dart';
import 'package:admin_page/i18n/strings.g.dart';
import 'package:admin_page/navigation/navigator.dart';
import 'package:admin_page/pages/scanned_person/widgets/person_page.dart';
import 'package:admin_page/pages/services/widgets/actions_row.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScannedPerson extends StatelessWidget {
  ScannedPerson({super.key, required this.qrToken}) {
    scannedConverter = ScannedConverter(scannedService: GetIt.I<ChopperClient>().getService<ScannedService>());
    scannedController = ScannedController(scannedConverter: scannedConverter);
  }

  final String qrToken;

  // final ScannedController controller = GetIt.I<ScannedController>();

  late final ScannedConverter scannedConverter;
  late final ScannedController scannedController;

  @override
  Widget build(BuildContext context) {
    scannedController.scanQr(qrToken);
    return Observer(
      builder: (context) {
        if (scannedController.isScanning) {
          return Center(
            child: LoadingAnimationWidget.prograssiveDots(color: Color.fromRGBO(67, 67, 244, 1), size: 60),
          );
        }

        if (scannedController.scannedResultStatus == ScannedResultStatus.tokendInvalid) {
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

        return PersonScannedPage(scannedUserId: scannedController.userId);
      },
    );
  }
}
