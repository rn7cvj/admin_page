import 'package:admin_page/contollers/calendar/calendar_contoller.dart';
import 'package:admin_page/i18n/strings.g.dart';
import 'package:admin_page/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'widgets/actions_row.dart';
import 'widgets/calendar_page_mobile.dart';

class CalendarPortrait extends StatelessWidget {
  CalendarPortrait({super.key});

  final CalendarController _controller = GetIt.I<CalendarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.backgoundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ActionsRow(actions: [
              ActionButton(
                lable: t.calendar.new_event,
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
              // const VerticalDivider(
              //   width: 16,
              // ),
              ActionButton(
                lable: t.calendar.edit,
                onPressed: () {},
                icon: const Icon(Icons.edit_outlined),
              ),
              // const VerticalDivider(
              //   width: 16,
              // ),
              ActionButton(
                lable: t.calendar.download,
                onPressed: () {},
                icon: const Icon(Icons.download),
              ),
            ]),
          ),
          Expanded(child: Observer(builder: (_) {
            if (_controller.isLoading) {
              return Center(
                child: LoadingAnimationWidget.prograssiveDots(color: Color.fromRGBO(67, 67, 244, 1), size: 60),
              );
            }
            return CalendarPageMobile(
              data: _controller.events,
              updateCallback: _controller.fetchNewEvents,
              shoudUpdate: _controller.shoudUpdateEvent,
            );
          }))
        ]),
      ),
    );
  }
}
