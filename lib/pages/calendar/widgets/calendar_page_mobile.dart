import 'package:admin_page/i18n/strings.g.dart';
import 'package:admin_page/models/event_viewmodel.dart';
import 'package:admin_page/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class CalendarPageMobile extends StatelessWidget {
  const CalendarPageMobile({
    super.key,
    required this.data,
    required this.updateCallback,
    required this.shoudUpdate,
  });

  final ObservableList<EventViewModel> data;

  final Future<void> Function() updateCallback;
  final bool Function() shoudUpdate;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: data
          .map((event) => ListTile(
                title: Text(event.eventName!),
                subtitle: Text(event.beginTime!.substring(0, 10)),
                onTap: () => showPersonInfoDialog(context, event),
              ))
          .toList(),
    );
  }

  void showPersonInfoDialog(BuildContext context, EventViewModel event) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text(event.eventName!),
          content: SizedBox(
            // height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${t.calendar.event_column_name}:"),
                      Text(event.eventName!),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${t.calendar.event_column_begin}:"),
                      Text(event.beginTime!),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${t.calendar.event_column_end}:"),
                      Text(event.endTime!),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${t.calendar.event_column_building}:"),
                      Text(event.buildingName!),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${t.calendar.event_column_area}:"),
                      Text(event.areaName!),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${t.calendar.event_column_total_spaces}:"),
                      Text(event.totalSpaces!.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${t.calendar.event_column_occupied_spaces}:"),
                      Text(event.occupiedSpaces!.toString()),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(context.appTheme.buttonColor),
                  iconColor: MaterialStateProperty.all(context.appTheme.buttonIconColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  visualDensity: VisualDensity.comfortable),
              onPressed: () {},
              icon: const Icon(Icons.person),
              label: Text("Подробнее", style: context.appTheme.buttonextStyle.copyWith(fontSize: 12)),
            )
          ],
        );
      },
    );
  }
}
