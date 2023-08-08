import 'package:admin_page/features/navigation/widgets/navigation_button.dart';
import 'package:admin_page/features/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavigationRail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104,
      // decoration:  BoxDecoration(color: context.appTheme.navigationTheme.backgoundColor),
      child: Column(
        children: [
          // Logo
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Center(
              child: SvgPicture.asset("assets/icons/logo.svg"),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: NavigationButton(svgPath: "assets/icons/dashboard.svg", isSelected: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: NavigationButton(svgPath: "assets/icons/people.svg", isSelected: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: NavigationButton(svgPath: "assets/icons/calculator.svg", isSelected: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: NavigationButton(svgPath: "assets/icons/calendar.svg", isSelected: false),
                  ),
                ],
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(color: Colors.white, onPressed: () {}, icon: const Icon(Icons.people)),
          ),
          SizedBox(
            height: 64,
          )
        ],
      ),
    );
  }
}
