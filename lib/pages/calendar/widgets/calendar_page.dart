import 'dart:math';

import 'package:admin_page/i18n/strings.g.dart';
import 'package:admin_page/models/event_viewmodel.dart';
import 'package:admin_page/models/person_viewmodel.dart';
import 'package:admin_page/scrollable_table_view/scrollable_table_view.dart';
import 'package:admin_page/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({
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
    ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      double scrollPercent = (scrollController.position.pixels / scrollController.position.maxScrollExtent);

      if (scrollPercent > 0.7 && shoudUpdate()) {
        // print("updateCallback");
        updateCallback();
      }
    });

    return LayoutBuilder(
      builder: (context, constrain) {
        return Observer(
          builder: (context) {
            return ScrollableTableView(
              verticalScrollContoller: scrollController,
              headers: [
                TableViewHeader(
                  label: t.calendar.event_column_name,
                  textStyle: context.appTheme.tabelHeadlineTextStyle,
                  alignment: Alignment.centerLeft,
                  width: max(300, (300 / 1920) * constrain.minWidth),
                  minWidth: 300,
                ),
                TableViewHeader(
                  label: t.calendar.event_column_begin,
                  textStyle: context.appTheme.tabelHeadlineTextStyle,
                  alignment: Alignment.centerLeft,
                  width: max(200, (200 / 1920) * constrain.minWidth),
                  minWidth: 200,
                ),
                TableViewHeader(
                  label: t.calendar.event_column_end,
                  textStyle: context.appTheme.tabelHeadlineTextStyle,
                  alignment: Alignment.centerLeft,
                  width: max(200, (200 / 1920) * constrain.minWidth),
                  minWidth: 200,
                ),
                TableViewHeader(
                  label: t.calendar.event_column_building,
                  textStyle: context.appTheme.tabelHeadlineTextStyle,
                  alignment: Alignment.centerLeft,
                  width: max(200, (200 / 1920) * constrain.minWidth),
                  minWidth: 200,
                ),
                TableViewHeader(
                  label: t.calendar.event_column_area,
                  textStyle: context.appTheme.tabelHeadlineTextStyle,
                  alignment: Alignment.centerLeft,
                  width: max(220, (220 / 1920) * constrain.minWidth),
                  minWidth: 220,
                ),
                TableViewHeader(
                  label: t.calendar.event_column_total_spaces,
                  textStyle: context.appTheme.tabelHeadlineTextStyle,
                  alignment: Alignment.centerLeft,
                  width: max(240, (240 / 1920) * constrain.minWidth),
                  minWidth: 240,
                ),
                TableViewHeader(
                  label: t.calendar.event_column_occupied_spaces,
                  textStyle: context.appTheme.tabelHeadlineTextStyle,
                  alignment: Alignment.centerLeft,
                  width: max(240, (240 / 1920) * constrain.maxWidth),
                  minWidth: 240,
                ),
              ],
              rows: data.map(
                (record) {
                  List<TableViewCell> cells = [
                    TableViewCell(
                      alignment: Alignment.centerLeft,
                      // child: Text(record.eventName!),
                      child: TextButton(onPressed: () {}, child: Text(record.eventName!)),
                    ),
                    TableViewCell(
                      alignment: Alignment.centerLeft,
                      child: Text(record.beginTime!),
                    ),
                    TableViewCell(
                      alignment: Alignment.centerLeft,
                      child: Text(record.endTime!),
                    ),
                    TableViewCell(
                      alignment: Alignment.centerLeft,
                      child: Text(record.buildingName!),
                    ),
                    TableViewCell(
                      alignment: Alignment.centerLeft,
                      child: Text(record.areaName!),
                    ),
                    TableViewCell(
                      alignment: Alignment.centerLeft,
                      child: Text(record.totalSpaces!.toString()),
                    ),
                    TableViewCell(
                      alignment: Alignment.centerLeft,
                      child: Text(record.occupiedSpaces!.toString()),
                    ),
                  ];

                  return TableViewRow(
                    height: 60,
                    cells: cells,
                  );
                },
              ).toList(),
            );
          },
        );
      },
    );
  }
}
