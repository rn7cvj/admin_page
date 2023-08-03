import 'package:flutter/material.dart';

class TabBarSelector extends StatelessWidget {
  TabBarSelector({super.key, required this.tabBarController});

  final TabController tabBarController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TabBar(
        indicatorColor: const Color.fromRGBO(67, 67, 244, 1),
        labelColor: const Color.fromRGBO(67, 67, 244, 1),
        unselectedLabelColor: const Color.fromRGBO(193, 193, 193, 1),
        controller: tabBarController,
        isScrollable: true,
        labelPadding: EdgeInsets.all(8.0),
        labelStyle: TextStyle(fontSize: 28),
        tabAlignment: TabAlignment.start,
        tabs: [
          Tab(text: "Посетители"),
          Tab(text: "Тренера"),
          Tab(text: "Сотрудникик"),
        ],
      ),
    );
  }
}
