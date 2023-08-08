import 'dart:math';

import 'package:admin_page/features/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class UsersTable extends StatelessWidget {
  const UsersTable({super.key, required this.data});

  final List<List<String>> data;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constrain) {
          return ScrollableTableView(
            headers: [
              TableViewHeader(
                label: "ФИО",
                textStyle: context.appTheme.tabelHeadlineTextStyle,
                alignment: Alignment.centerLeft,
                width: max(400, (400 / 1920) * constrain.minWidth),
                minWidth: 400,
              ),
              TableViewHeader(
                label: "Пол",
                textStyle: context.appTheme.tabelHeadlineTextStyle,
                alignment: Alignment.centerLeft,
                width: max(150, (150 / 1920) * constrain.minWidth),
                minWidth: 150,
              ),
              TableViewHeader(
                label: "Дата рождения",
                textStyle: context.appTheme.tabelHeadlineTextStyle,
                alignment: Alignment.centerLeft,
                width: max(200, (200 / 1920) * constrain.minWidth),
                minWidth: 200,
              ),
              TableViewHeader(
                label: "Статус",
                textStyle: context.appTheme.tabelHeadlineTextStyle,
                alignment: Alignment.centerLeft,
                width: max(200, (200 / 1920) * constrain.minWidth),
                minWidth: 200,
              ),
              TableViewHeader(
                label: "Телефон",
                textStyle: context.appTheme.tabelHeadlineTextStyle,
                alignment: Alignment.centerLeft,
                width: max(220, (220 / 1920) * constrain.minWidth),
                minWidth: 220,
              ),
              TableViewHeader(
                label: "Последнее посещение",
                textStyle: context.appTheme.tabelHeadlineTextStyle,
                alignment: Alignment.centerLeft,
                width: max(240, (240 / 1920) * constrain.minWidth),
                minWidth: 240,
              ),
              TableViewHeader(
                label: "Профиль",
                textStyle: context.appTheme.tabelHeadlineTextStyle,
                alignment: Alignment.centerLeft,
                width: max(240, (240 / 1920) * constrain.maxWidth),
                minWidth: 240,
              ),
            ],
            rows: data.map(
              (record) {
                return TableViewRow(
                  height: 60,
                  cells: record.map((value) {
                    return TableViewCell(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        value,
                        style: context.appTheme.tabelContentTextStyle,
                      ),
                    );
                  }).toList(),
                );
              },
            ).toList(),
          );
        },
      );
}
