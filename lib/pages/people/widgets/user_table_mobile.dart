import 'package:admin_page/models/person_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class UserTableMobile extends StatelessWidget {
  const UserTableMobile({super.key, required this.data, required this.updateCallback, required this.shoudUpdate});

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
    return ListView(
      controller: scrollController,
      children: data
          .map((person) => ListTile(
                onTap: () {},
                title: Text(person.name!),
              ))
          .toList(),
    );
  }
}
