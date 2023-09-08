import 'package:admin_page/Pages/services/widgets/building_tab.dart';
import 'package:admin_page/Pages/services/widgets/service_tab.dart';
import 'package:admin_page/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'widgets/actions_row.dart';
import 'widgets/lable.dart';
import 'widgets/tab_bar_selector.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> with TickerProviderStateMixin {
  late final tabBarContoller = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.backgoundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Lable(),
            ),
            TabBarSelector(tabBarController: tabBarContoller),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
              child: ActionsRow(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TabBarView(
                  controller: tabBarContoller,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    ServiceTab(),
                    BuildingTab(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
