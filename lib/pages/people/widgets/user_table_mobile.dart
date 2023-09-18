import 'package:admin_page/i18n/strings.g.dart';
import 'package:admin_page/models/person_viewmodel.dart';
import 'package:admin_page/navigation/navigator.dart';
import 'package:admin_page/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                onTap: () => showPersonInfoDialog(context, person),
                onLongPress: () => AppNavigator.goUserPage(person.id.toString()),
                title: Text(person.name!),
              ))
          .toList(),
    );
  }

  void showPersonInfoDialog(BuildContext context, PersonViewModel person) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text(person.name!),
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
                      Text("${t.people.column_sex}:"),
                      Text(person.gender == "m" ? "Мужской" : "Женский"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${t.people.column_birthdate}:"),
                      Text(person.birthdate!),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${t.people.column_status}:"),
                      Text(person.status!),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${t.people.column_phone_number}:"),
                      Text(person.phoneNumber ?? "не указан"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${t.people.column_last_visit}:"),
                      Text(person.lastVisit ?? "никогда"),
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
              onPressed: () {
                context.pop();
                AppNavigator.goUserPage(person.id.toString());
              },
              icon: const Icon(Icons.person),
              label: Text("Подробнее", style: context.appTheme.buttonextStyle.copyWith(fontSize: 12)),
            )
          ],
        );
      },
    );
  }
}
