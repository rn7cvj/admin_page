import 'package:admin_page/contollers/calendar/calendar_contoller.dart';
import 'package:admin_page/i18n/strings.g.dart';
import 'package:admin_page/pages/services/widgets/actions_row.dart';
import 'package:admin_page/themes/app_theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'widgets/calendar_page.dart';
import 'widgets/lable.dart';
import 'widgets/tab_bar_selector.dart';

class CalendarLandscape extends StatelessWidget {
  CalendarLandscape({super.key});

  final CalendarController _controller = GetIt.I<CalendarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.backgoundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Lable(),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ActionsRow(actions: [
                  ActionButton(
                    lable: t.calendar.new_event,
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform.pickFiles();

                      if (result == null) return;

                      _controller.importExcel(result.files.single.bytes!);
                    },
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
                    onPressed: _controller.exportExcel,
                    icon: const Icon(Icons.download),
                  ),
                ]),
              ),
            ),
            Expanded(
              child: Observer(
                builder: (context) {
                  if (_controller.isLoading) {
                    return Center(
                      child: LoadingAnimationWidget.prograssiveDots(color: Color.fromRGBO(67, 67, 244, 1), size: 60),
                    );
                  }
                  return CalendarPage(
                      data: _controller.events,
                      updateCallback: _controller.fetchNewEvents,
                      shoudUpdate: _controller.shoudUpdateEvent);
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TabBarSelector(tabBarController: tabBarContoller),
            // ),
            // Expanded(
            //   child: TabBarView(
            //     physics: const NeverScrollableScrollPhysics(),
            //     controller: tabBarContoller,
            //     children: const [
            //       CalendarPage(),
            //       CalendarPage(),
            //       CalendarPage(),
            //       CalendarPage(),
            //       CalendarPage(),
            //       CalendarPage(),
            //       CalendarPage(),
            //       CalendarPage(),
            //       CalendarPage(),
            //       CalendarPage(),
            //       CalendarPage(),
            //       CalendarPage(),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
