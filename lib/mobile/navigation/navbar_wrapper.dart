import 'package:admin_page/mobile/navigation/navigator.dart';
import 'package:admin_page/mobile/navigation/routes_name.dart';
import 'package:fefufit_uikit/fefufit_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class NavbarWrapper extends StatelessWidget {
  const NavbarWrapper({super.key, required this.child, required this.state});

  final Widget child;
  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    final Color navColor =
        context.ffTheme.color.onMinorControllColor.withOpacity(0.6);

    final Color selectedColor = context.ffTheme.color.onMinorControllColor;

    final String fullPath = state.fullPath ?? "";

    final bool isHomeSelected = fullPath == RoutesName.home.fullPath;
    final bool isCalendarSelected = fullPath == RoutesName.calendar.fullPath;
    final bool isDashboardSelected = fullPath == RoutesName.dashboard.fullPath;

    final bool shoudShowNavBar =
        isHomeSelected || isCalendarSelected || isDashboardSelected;

    double navBarTopOffset = MediaQuery.sizeOf(context).height - 56 - 16;
    final double navBarLeftOffset =
        (MediaQuery.sizeOf(context).width - 250) / 2;

    if (!shoudShowNavBar) navBarTopOffset = MediaQuery.sizeOf(context).height;

    return Stack(
      children: [
        child,
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          top: navBarTopOffset,
          left: navBarLeftOffset,
          child: FFNavBar(
            [
              FFNavBarElement(
                icon: Padding(
                  padding: const EdgeInsets.all(ffPaddingMedium),
                  child: SvgPicture.asset(
                    "assets/icons/home_outline.svg",
                    colorFilter: ColorFilter.mode(
                        isHomeSelected ? selectedColor : navColor,
                        BlendMode.srcIn),
                  ),
                ),
                onTap: AppNavigator.openHome,
              ),
              FFNavBarElement(
                icon: Padding(
                  padding: const EdgeInsets.all(ffPaddingMedium),
                  child: SvgPicture.asset(
                    "assets/icons/calendar_outline.svg",
                    colorFilter: ColorFilter.mode(
                        isCalendarSelected ? selectedColor : navColor,
                        BlendMode.srcIn),
                  ),
                ),
                onTap: AppNavigator.openCalendar,
              ),
              FFNavBarElement(
                icon: Padding(
                  padding: const EdgeInsets.all(ffPaddingMedium),
                  child: SvgPicture.asset(
                    "assets/icons/service_outline.svg",
                    colorFilter: ColorFilter.mode(
                        isDashboardSelected ? selectedColor : navColor,
                        BlendMode.srcIn),
                  ),
                ),
                onTap: AppNavigator.openDashboard,
              ),
            ],
            areaHeight: 60,
            navbarColor: context.ffTheme.color.minorControllColor,
          ),
        )
      ],
    );
  }
}
