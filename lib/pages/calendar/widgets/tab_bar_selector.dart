import 'package:admin_page/themes/app_theme.dart';
import 'package:flutter/material.dart';

class TabBarSelector extends StatelessWidget {
  const TabBarSelector({super.key, required this.tabBarController});

  final TabController tabBarController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TabBar(
        dividerColor: Colors.transparent,
        indicatorColor: context.appTheme.indicatorTabColor,
        labelColor: context.appTheme.secetedTabColor,
        unselectedLabelColor: context.appTheme.unsecetedTabColor,
        controller: tabBarController,
        isScrollable: true,
        labelPadding: const EdgeInsets.all(8.0),
        labelStyle: context.appTheme.selectedTabTextStyle,
        unselectedLabelStyle: context.appTheme.unselectedTabTextStyle,
        tabAlignment: TabAlignment.start,
        tabs: const [
          Text("Январь"),
          Text("Февраль"),
          Text("Март"),
          Text("Апрель"),
          Text("Май"),
          Text("Июнь"),
          Text("Июль"),
          Text("Август"),
          Text("Сентябрь"),
          Text("Октябрь"),
          Text("Ноябрь"),
          Text("Декабрт"),
        ],
      ),
    );
  }
}
