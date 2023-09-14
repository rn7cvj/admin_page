import 'dart:math';

import 'package:admin_page/models/person_viewmodel.dart';
import 'package:admin_page/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../i18n/strings.g.dart';
import '../../../scrollable_table_view/scrollable_table_view.dart';

class UsersTable extends StatelessWidget {
  const UsersTable({super.key, required this.data, required this.updateCallback, required this.shoudUpdate});

  final ObservableList<PersonViewModel> data;

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
                  label: t.people.column_fullname,
                  textStyle: context.appTheme.tabelHeadlineTextStyle,
                  alignment: Alignment.centerLeft,
                  width: max(400, (400 / 1920) * constrain.minWidth),
                  minWidth: 400,
                ),
                TableViewHeader(
                  label: t.people.column_sex,
                  textStyle: context.appTheme.tabelHeadlineTextStyle,
                  alignment: Alignment.centerLeft,
                  width: max(150, (150 / 1920) * constrain.minWidth),
                  minWidth: 150,
                ),
                TableViewHeader(
                  label: t.people.column_birthdate,
                  textStyle: context.appTheme.tabelHeadlineTextStyle,
                  alignment: Alignment.centerLeft,
                  width: max(200, (200 / 1920) * constrain.minWidth),
                  minWidth: 200,
                ),
                TableViewHeader(
                  label: t.people.column_status,
                  textStyle: context.appTheme.tabelHeadlineTextStyle,
                  alignment: Alignment.centerLeft,
                  width: max(200, (200 / 1920) * constrain.minWidth),
                  minWidth: 200,
                ),
                TableViewHeader(
                  label: t.people.column_phone_number,
                  textStyle: context.appTheme.tabelHeadlineTextStyle,
                  alignment: Alignment.centerLeft,
                  width: max(220, (220 / 1920) * constrain.minWidth),
                  minWidth: 220,
                ),
                TableViewHeader(
                  label: t.people.column_last_visit,
                  textStyle: context.appTheme.tabelHeadlineTextStyle,
                  alignment: Alignment.centerLeft,
                  width: max(240, (240 / 1920) * constrain.minWidth),
                  minWidth: 240,
                ),
                TableViewHeader(
                  label: t.people.column_profile,
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
                      child: Text(record.name!),
                    ),
                    TableViewCell(
                      alignment: Alignment.centerLeft,
                      child: Text(record.gender == "m" ? "Мужской" : "Женский"),
                    ),
                    TableViewCell(
                      alignment: Alignment.centerLeft,
                      child: Text(record.birthdate!),
                    ),
                    TableViewCell(
                      alignment: Alignment.centerLeft,
                      child: Text(record.status!),
                    ),
                    TableViewCell(
                      alignment: Alignment.centerLeft,
                      child: Text(record.phoneNumber ?? "не указан"),
                    ),
                    TableViewCell(
                      alignment: Alignment.centerLeft,
                      child: Text(record.lastVisit ?? "никогда"),
                    ),
                    const TableViewCell(
                      alignment: Alignment.centerLeft,
                      child: Text("Просмотреть"),
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
