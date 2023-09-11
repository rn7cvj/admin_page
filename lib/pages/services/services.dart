import 'package:admin_page/contollers/building/building_contoller.dart';
import 'package:admin_page/contollers/service/service_controller.dart';
import 'package:admin_page/pages/services/services_landscape.dart';
import 'package:admin_page/pages/services/services_portrait.dart';
import 'package:admin_page/pages/services/widgets/building_tab.dart';
import 'package:admin_page/pages/services/widgets/service_tab.dart';
import 'package:admin_page/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'widgets/actions_row.dart';
import 'widgets/lable.dart';
import 'widgets/tab_bar_selector.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).shortestSide < 600) return const ServicesPortrait();

    return const ServicesLandscape();
  }
}
