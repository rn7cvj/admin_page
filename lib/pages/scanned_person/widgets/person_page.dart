import 'package:admin_page/contollers/scanned_person/scanned_person_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PersonScannedPage extends StatelessWidget {
  PersonScannedPage({super.key, required this.scannedUserId});

  final String scannedUserId;

  final ScannedPersonContoller contoller = GetIt.I<ScannedPersonContoller>();

  @override
  Widget build(BuildContext context) {
    contoller.getUserData(scannedUserId);
    return Observer(builder: (context) {
      if (contoller.isLoading) {
        return Center(
          child: LoadingAnimationWidget.prograssiveDots(color: Color.fromRGBO(67, 67, 244, 1), size: 60),
        );
      }

      return Center(
        child: Text(contoller.userData?.toJson().toString() ?? "Error"),
      );
    });
  }
}
