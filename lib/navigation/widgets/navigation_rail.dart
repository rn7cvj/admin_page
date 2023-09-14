import 'package:admin_page/navigation/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationRail extends StatelessWidget {
  const CustomNavigationRail({super.key, required this.state});

  final GoRouterState state;

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
                    child: NavigationButton(
                      selectedSvgPath: "assets/icons/dashboard.svg",
                      unselectedSvgPath: "assets/icons/dashboard_outline.svg",
                      isSelected: state.fullPath == "/dashboard",
                      onTap: () => context.go("/dashboard"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: NavigationButton(
                      selectedSvgPath: "assets/icons/people.svg",
                      unselectedSvgPath: "assets/icons/people_outline.svg",
                      isSelected: state.fullPath == "/people",
                      onTap: () => context.go("/people"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: NavigationButton(
                      selectedSvgPath: "assets/icons/service.svg",
                      unselectedSvgPath: "assets/icons/service_outline.svg",
                      isSelected: state.fullPath == "/service",
                      onTap: () => context.go("/service"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: NavigationButton(
                      selectedSvgPath: "assets/icons/calendar.svg",
                      unselectedSvgPath: "assets/icons/calendar_outline.svg",
                      isSelected: state.fullPath == "/calendar",
                      onTap: () => context.go("/calendar"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: NavigationButton(
                      selectedSvgPath: "assets/icons/calculator.svg",
                      unselectedSvgPath: "assets/icons/calculator_outline.svg",
                      isSelected: state.fullPath == "/calculator",
                      onTap: () => context.go("/calculator"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(color: Colors.white, onPressed: () {}, icon: const Icon(Icons.people)),
          ),
          const SizedBox(
            height: 64,
          )
        ],
      ),
    );
  }
}
