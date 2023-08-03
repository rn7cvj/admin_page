import 'package:admin_page/features/services/widgets/building_card.dart';
import 'package:flutter/material.dart';

class BuildingTab extends StatelessWidget {
  const BuildingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        direction: Axis.horizontal,
        children: [
          BuildingCard(lable: "S", buildingType: "спортивный корпус", zones: [
            "Плавательный бассейн",
            "Зал кроссфита",
            "Беговая дорожка",
            "Балкон",
            "Зал единоборств",
            "Зал настольного тенниса",
          ]),
          BuildingCard(
            lable: "S1",
            buildingType: "спортивный корпус",
            zones: ["Тренажрный зал", "ФОК", "Зал аэробики"],
          ),
          BuildingCard(
            lable: "S2",
            buildingType: "спортивный корпус",
            zones: ["Плавательный бассейн", "Зал бокса", "Зал единоборств"],
          ),
          BuildingCard(
            lable: "Корпус 1",
            buildingType: "жилой корпус",
            zones: ["Тренажерный зал"],
          ),
          BuildingCard(
            lable: "Корпус 11",
            buildingType: "жилой корпус",
            zones: ["Зал групповых программ", "Тренажерный зал", "Зал аэробики"],
          ),
          BuildingCard(
            lable: "Улица",
            buildingType: "",
            zones: ["Открытые теннисные корты"],
          ),
        ],
      ),
    );
  }
}
