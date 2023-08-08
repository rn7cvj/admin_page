import 'package:admin_page/features/themes/app_theme.dart';
import 'package:flutter/material.dart';

class TabBarSelector extends StatelessWidget {
  TabBarSelector({super.key, required this.tabBarController});

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
        labelPadding: EdgeInsets.all(8.0),
        labelStyle: context.appTheme.selectedTabTextStyle,
        unselectedLabelStyle: context.appTheme.unselectedTabTextStyle,
        tabAlignment: TabAlignment.start,
        tabs: const [
          // Tab(text: "Занятия"),
          // Tab(text: "Корпуса"),
          Tab(child: Text("Занятия")),
          Tab(child: Text("Корпуса")),
        ],
      ),
    );
  }
}
