import 'package:admin_page/contollers/building/building_contoller.dart';
import 'package:admin_page/contollers/service/service_controller.dart';
import 'package:admin_page/pages/services/widgets/building_tab.dart';
import 'package:admin_page/pages/services/widgets/service_tab.dart';
import 'package:admin_page/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'widgets/actions_row.dart';
import 'widgets/tab_bar_selector.dart';

class ServicesPortrait extends StatefulWidget {
  const ServicesPortrait({super.key});

  @override
  State<ServicesPortrait> createState() => _ServicesPortraitState();
}

class _ServicesPortraitState extends State<ServicesPortrait> with TickerProviderStateMixin {
  late final tabBarContoller = TabController(length: 2, vsync: this);

  final ServiceController _serviceController = GetIt.I<ServiceController>();
  final BuildingController _buildingController = GetIt.I<BuildingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.backgoundColor,
      body: Builder(builder: (context) {
        _buildingController.addBuidlingMessageStream.stream.listen((message) {
          showSnackBar(context, message);
        });

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Lable(),
              // ),
              TabBarSelector(tabBarController: tabBarContoller),
              // const Padding(
              //   padding: EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
              //   child: ActionsRow(),
              // ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Observer(builder: (_) {
                    if (_serviceController.isLoading || _buildingController.isLoading) {
                      return Center(
                        child: LoadingAnimationWidget.prograssiveDots(color: Color.fromRGBO(67, 67, 244, 1), size: 60),
                      );
                    }

                    return TabBarView(
                      controller: tabBarContoller,
                      // physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ServiceTab(),
                        BuildingTab(),
                      ],
                    );
                  }),
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  void showSnackBar(BuildContext context, AddBuildingMessage message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message.info.name),
      ),
    );
  }
}
