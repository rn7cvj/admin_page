import 'package:admin_page/pages/auth/auth_landscape.dart';
import 'package:admin_page/pages/auth/auth_portrait.dart';
import 'package:admin_page/pages/people/people_landscape.dart';
import 'package:admin_page/themes/app_theme.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:admin_page/pages/auth/widgets/logo.dart';
import 'package:admin_page/contollers/auth/auth_contoller.dart';
import 'package:admin_page/pages/auth/widgets/auth_buttons.dart';

import 'people_portrait.dart';

class People extends StatelessWidget {
  People({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).shortestSide < 600) return PeoplePortrait();

    return PeopleLandscape();
  }
}
