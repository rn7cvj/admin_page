import 'package:admin_page/contollers/user_data/user_data_controller.dart';
import 'package:admin_page/contollers/user_data/user_data_converter.dart';
import 'package:admin_page/contollers/user_data/user_data_service.dart';
import 'package:admin_page/pages/user_page/widgets/user_card.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class UserPagePortrait extends StatelessWidget {
  UserPagePortrait({super.key, required this.userId}) {
    userDataConverter = UserDataConverter(scannedPersonService: GetIt.I<ChopperClient>().getService<UserDataService>());
    userDataContoller = UserDataContoller(scannedPersonConverter: userDataConverter);
    userDataContoller.getUserData(userId);
  }

  final String userId;

  late UserDataConverter userDataConverter;
  late UserDataContoller userDataContoller;

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) {
          String userName = "Ошибка загрузки";
          if (userDataContoller.userData != null) {
            userName = "${userDataContoller.userData?.firstName} ${userDataContoller.userData?.thirdName} ";
          }

          return Scaffold(
            appBar: AppBar(
              title: userDataContoller.isLoading
                  ? LoadingAnimationWidget.prograssiveDots(color: Color.fromRGBO(67, 67, 244, 1), size: 60)
                  : Text(userName),
            ),
            body: userDataContoller.isLoading ? null : UserCard(userData: userDataContoller.userData!),
          );
        },
      );
}
