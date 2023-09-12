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
      required this.buildingId});

  final String lable;
  final String buildingType;

  final List<String> zones;

  final int buildingId;

  final bool isEditing;

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
          Positioned(
            right: 0,
            top: 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: isEditing ? 1 : 0,
              child: IconButton(
                onPressed: isEditing
                    ? () {
                        _controller.deleteBuilding(buildingId);
                      }
                    : null,
                icon: const Icon(Icons.delete),
              ),
            ),
          )
        ],
      ),
    );
  }
}
