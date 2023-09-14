import 'package:admin_page/contollers/service/service_controller.dart';
import 'package:admin_page/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'actions_row.dart';
import 'service_card.dart';

class ServiceTab extends StatelessWidget {
  ServiceTab({super.key});

  final ServiceController _controller = GetIt.I<ServiceController>();

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
                  lable: t.services.new_category,
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
                // const VerticalDivider(
                //   width: 16,
                // ),
                ActionButton(
                  lable: t.services.edit,
                  onPressed: () {},
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
        ],
      ),
    );
  }
}
