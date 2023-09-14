import 'package:admin_page/contollers/people/people_controller.dart';
import 'package:admin_page/pages/people/widgets/tab_bar_selector.dart';
import 'package:admin_page/pages/people/widgets/actions_row.dart';
import 'package:admin_page/pages/people/widgets/user_table_mobile.dart';
import 'package:admin_page/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobx/mobx.dart';

class PeoplePortrait extends StatefulWidget {
  const PeoplePortrait({super.key});

  @override
  State<PeoplePortrait> createState() => _PeoplePortraitState();
}

class _PeoplePortraitState extends State<PeoplePortrait> with TickerProviderStateMixin {
  late final tabBarContoller = TabController(length: 3, vsync: this);

  PeopleContoller contoller = GetIt.I<PeopleContoller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.backgoundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 16.0),
        child: Column(
          children: [
            // const Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Lable(),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: TabBarSelector(
                tabBarController: tabBarContoller,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ActionsRow(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(
                  builder: (context) {
                    if (contoller.isLoading) {
                      return Center(
                        child: LoadingAnimationWidget.prograssiveDots(color: Color.fromRGBO(67, 67, 244, 1), size: 60),
                      );
                    }

                    return TabBarView(
                      // physics: const NeverScrollableScrollPhysics(),
                      controller: tabBarContoller,
                      children: [
                        UserTableMobile(
                          data: contoller.visitors.asObservable(),
                          updateCallback: contoller.fetchNewVisitors,
                          shoudUpdate: contoller.shoudUpdateVisitors,
                        ),
                        UserTableMobile(
                          data: contoller.trainers.asObservable(),
                          updateCallback: contoller.fetchNewTrainers,
                          shoudUpdate: contoller.shoudUpdateTrainers,
                        ),
                        UserTableMobile(
                          data: contoller.staff.asObservable(),
                          updateCallback: contoller.fetchNewStaff,
                          shoudUpdate: contoller.shoudUpdateStaff,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
