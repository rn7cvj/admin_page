import 'package:admin_page/contollers/service/service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'service_card.dart';

class ServiceTab extends StatelessWidget {
  ServiceTab({super.key});

  final ServiceController _controller = GetIt.I<ServiceController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Observer(
        builder: (_) {
          return Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            direction: Axis.horizontal,
            children: _controller.categories
                .map(
                  (category) => ServiceCard(
                    lable: category.name,
                    services: category.services.map((service) => service.name).toList(),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
