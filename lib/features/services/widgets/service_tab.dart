import 'package:flutter/material.dart';

import 'service_card.dart';

class ServiceTab extends StatelessWidget {
  const ServiceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        direction: Axis.horizontal,
        children: [
          ServiceCard(lable: "Тренажерный зал", services: ["Тренажерный зал", "Кроссфит"]),
          ServiceCard(
            lable: "Бассейн",
            services: ["Свободное плавание", "Аквааэробика", "Обучение плаванию взрослых", "Обучение плаванию детей"],
          ),
          ServiceCard(
            lable: "Групповые занятия",
            services: [
              "Беговой клуб",
              "Степ-аэробика",
              "Силовая тренировка",
              "Танец живота",
              "Hot Iron",
              "Пилатес",
              "Fat burn",
              "Детская секция по фехтованию"
            ],
          ),
          ServiceCard(
            lable: "Единоборства",
            services: [
              "Бокс",
              "Карате",
              "ММА",
            ],
          ),
          ServiceCard(
            lable: "Игровые направления",
            services: [
              "Настольный тенис",
              "Тениис",
            ],
          ),
          ServiceCard(
            lable: "Групповые занятия",
            services: [
              "Беговой клуб",
              "Степ-аэробика",
              "Силовая тренировка",
              "Танец живота",
              "Hot Iron",
              "Пилатес",
              "Fat burn",
              "Детская секция по фехтованию"
            ],
          ),
          ServiceCard(
            lable: "Единоборства",
            services: [
              "Бокс",
              "Карате",
              "ММА",
            ],
          ),
          ServiceCard(
            lable: "Игровые направления",
            services: [
              "Настольный тенис",
              "Тениис",
            ],
          ),
          ServiceCard(
            lable: "Групповые занятия",
            services: [
              "Беговой клуб",
              "Степ-аэробика",
              "Силовая тренировка",
              "Танец живота",
              "Hot Iron",
              "Пилатес",
              "Fat burn",
              "Детская секция по фехтованию"
            ],
          ),
          ServiceCard(
            lable: "Единоборства",
            services: [
              "Бокс",
              "Карате",
              "ММА",
            ],
          ),
          ServiceCard(
            lable: "Игровые направления",
            services: [
              "Настольный тенис",
              "Тениис",
            ],
          ),
        ],
      ),
    );
  }
}
