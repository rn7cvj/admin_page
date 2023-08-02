import 'dart:math';

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
                alignment: Alignment.centerLeft,
                width: max(340, (340 / 1920) * constrain.minWidth),
                minWidth: 340,
              ),
              TableViewHeader(
                label: "Пол",
                alignment: Alignment.centerLeft,
                width: max(150, (150 / 1920) * constrain.minWidth),
                minWidth: 150,
              ),
              TableViewHeader(
                label: "Дата рождения",
                alignment: Alignment.centerLeft,
                width: max(200, (200 / 1920) * constrain.minWidth),
                minWidth: 200,
              ),
              TableViewHeader(
                label: "Статус",
                alignment: Alignment.centerLeft,
                width: max(200, (200 / 1920) * constrain.minWidth),
                minWidth: 200,
              ),
              TableViewHeader(
                label: "Телефон",
                alignment: Alignment.centerLeft,
                width: max(240, (240 / 1920) * constrain.minWidth),
                minWidth: 240,
              ),
              TableViewHeader(
                label: "Последнее посещение",
                alignment: Alignment.centerLeft,
                width: max(240, (240 / 1920) * constrain.minWidth),
                minWidth: 240,
              ),
              TableViewHeader(
                label: "Профиль",
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
                      child: Text(value),
                    );
                  }).toList(),
                );
              },
            ).toList(),
          );
        },
      );
}
