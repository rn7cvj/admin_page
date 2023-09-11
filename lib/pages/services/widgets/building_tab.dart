import 'package:admin_page/contollers/building/building_contoller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'building_card.dart';

class BuildingTab extends StatelessWidget {
  BuildingTab({super.key});

  final BuildingController _controller = GetIt.I<BuildingController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Observer(
        builder: (_) {
          return Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            direction: Axis.horizontal,
            children: _controller.buildings
                .map((building) => BuildingCard(
                      lable: building.name,
                      buildingType: "спортивный корпус",
                      zones: [],
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
