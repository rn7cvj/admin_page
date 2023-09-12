import 'package:admin_page/contollers/building/building_contoller.dart';
import 'package:admin_page/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BuildingCard extends StatelessWidget {
  BuildingCard(
      {super.key,
      required this.lable,
      required this.buildingType,
      required this.zones,
      required this.isEditing,
      required this.buildingId,
      required this.isActive});

  final String lable;
  final String buildingType;

  final List<String> zones;

  final int buildingId;

  final bool isEditing;
  final bool isActive;

  final BuildingController _controller = GetIt.I<BuildingController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      child: Stack(
        children: [
          Card(
            color: context.appTheme.cardColor,
            surfaceTintColor: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: Row(
                    children: [
                      Expanded(child: Text(lable, style: context.appTheme.cardHeadlineTextStyle)),
                      Expanded(
                        child: Text(
                          buildingType,
                          style: const TextStyle(fontSize: 18, color: Color.fromRGBO(67, 67, 244, 1)),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 43,
                ),
                ...zones
                    .map((text) => Padding(
                          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                          child: Text(
                            text,
                            style: context.appTheme.cardContentTextStyle,
                          ),
                        ))
                    .toList(),
                const SizedBox(
                  height: 24,
                )
              ],
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  color: isActive ? Colors.transparent : Colors.grey.withOpacity(0.4),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isEditing ? 1 : 0,
              child: Row(
                children: [
                  IconButton(
                    onPressed: isEditing
                        ? () {
                            isActive
                                ? _controller.deactiveteBuilding(buildingId)
                                : _controller.activateBuilding(buildingId, lable);
                          }
                        : null,
                    icon: Icon(isActive ? Icons.visibility : Icons.visibility_off),
                  ),
                  IconButton(
                    onPressed: isEditing ? () {} : null,
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
