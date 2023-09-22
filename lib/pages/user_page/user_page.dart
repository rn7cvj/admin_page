import 'package:admin_page/contollers/user_data/user_data_controller.dart';
import 'package:admin_page/contollers/user_data/user_data_converter.dart';
import 'package:admin_page/contollers/user_data/user_data_service.dart';
import 'package:admin_page/pages/user_page/user_page_landscape.dart';
import 'package:admin_page/pages/user_page/user_page_portrait.dart';
import 'package:admin_page/pages/user_page/widgets/user_card.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).shortestSide < 600) return UserPagePortrait(userId: userId);

    return UserPageLandscape(userId: userId);
  }
}
