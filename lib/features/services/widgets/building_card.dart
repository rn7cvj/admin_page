import 'package:flutter/material.dart';

class BuildingCard extends StatelessWidget {
  const BuildingCard({super.key, required this.lable, required this.buildingType, required this.zones});

  final String lable;
  final String buildingType;

  final List<String> zones;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
              child: Row(
                children: [
                  Expanded(child: Text(lable, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
                  Expanded(
                      child: Text(buildingType,
                          style: TextStyle(fontSize: 18, color: Color.fromRGBO(67, 67, 244, 1)),
                          textAlign: TextAlign.right)),
                ],
              ),
            ),
            const SizedBox(
              height: 43,
            ),
            ...zones
                .map((text) => Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                      child: Text(text),
                    ))
                .toList(),
            const SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
