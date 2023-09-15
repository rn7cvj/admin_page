import 'package:admin_page/pages/calendar/calendar_landscape.dart';
import 'package:admin_page/pages/calendar/calendar_portrait.dart';
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).shortestSide < 600) return CalendarPortrait();

    return CalendarLandscape();
  }
}
