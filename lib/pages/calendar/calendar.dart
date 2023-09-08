import 'package:admin_page/pages/services/widgets/actions_row.dart';
import 'package:flutter/material.dart';

import 'widgets/calendar_page.dart';
import 'widgets/lable.dart';
import 'widgets/tab_bar_selector.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> with TickerProviderStateMixin {
  late final tabBarContoller = TabController(length: 12, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Lable(),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ActionsRow(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBarSelector(tabBarController: tabBarContoller),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabBarContoller,
                children: const [
                  CalendarPage(),
                  CalendarPage(),
                  CalendarPage(),
                  CalendarPage(),
                  CalendarPage(),
                  CalendarPage(),
                  CalendarPage(),
                  CalendarPage(),
                  CalendarPage(),
                  CalendarPage(),
                  CalendarPage(),
                  CalendarPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
