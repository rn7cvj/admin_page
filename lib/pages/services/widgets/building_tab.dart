import 'package:admin_page/contollers/building/building_contoller.dart';
import 'package:admin_page/i18n/strings.g.dart';

import 'package:admin_page/themes/app_theme.dart';
// import 'package:admin_page/pages/calendar/widgets/actions_row.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'actions_row.dart';
import 'building_card.dart';
import 'text_field.dart';

class BuildingTab extends StatelessWidget {
  BuildingTab({super.key});

  final BuildingController _controller = GetIt.I<BuildingController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
            child: ActionsRow(
              actions: [
                ActionButton(
                  lable: t.services.new_building,
                  onPressed: () async => showPersonInfoDialog(context),
                  icon: const Icon(Icons.add),
                ),
                // const VerticalDivider(
                //   width: 16,
                // ),
                ActionButton(
                  lable: t.services.edit,
                  onPressed: () => _controller.switchEditingMod(),
                  icon: const Icon(Icons.edit_outlined),
                ),
                // const VerticalDivider(
                //   width: 16,
                // ),
                ActionButton(
                  lable: t.people.download,
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                ),
              ],
            ),
          ),
          Observer(
            builder: (_) {
              return Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                direction: Axis.horizontal,
                children: _controller.buildings
                    .map((building) => BuildingCard(
                          lable: building.name,
                          buildingId: building.id,
                          buildingType: "спортивный корпус",
                          zones: const [],
                          isEditing: _controller.isBuidlingEditing,
                          isActive: building.isActive,
                        ))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  void showPersonInfoDialog(BuildContext context) async {
    TextEditingController newBuidlingName = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text(
            t.services.new_building,
            style: context.appTheme.cardHeadlineTextStyle.copyWith(fontSize: 24),
          ),
          // titleTextStyle: ,
          content: SizedBox(
            // height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text("Название корпуса"),
                  CustomTextField(
                    validator: (value) => null,
                    controller: newBuidlingName,
                    obscureText: false,
                    labelText: "Название корпуса",
                  )
                ],
              ),
            ),
          ),
          actions: [
            Observer(builder: (_) {
              Widget label = _controller.isBuildingAdding
                  ? LoadingAnimationWidget.prograssiveDots(color: Colors.white, size: 25)
                  : Text("Добавить", style: context.appTheme.buttonextStyle.copyWith(fontSize: 12));

              return TextButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(context.appTheme.buttonColor),
                    iconColor: MaterialStateProperty.all(context.appTheme.buttonIconColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    visualDensity: VisualDensity.comfortable),
                onPressed: _controller.isBuildingAdding
                    ? null
                    : () async {
                        await _controller.addBuidling(newBuidlingName.text);
                        if (context.mounted) context.pop();
                      },
                icon: const Icon(Icons.add),
                label: label,
              );
            })
          ],
        );
      },
    );
  }
}
