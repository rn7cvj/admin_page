import 'package:admin_page/i18n/strings.g.dart';
import 'package:admin_page/router.dart';
import 'package:admin_page/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class ScaffoldWithDrawer extends StatelessWidget {
  const ScaffoldWithDrawer({super.key, required this.child, required this.state});

  final Widget child;
  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          getAppBarTitle(),
          style: context.appTheme.buttonextStyle,
        ),
        foregroundColor: Colors.white,
        backgroundColor: context.appTheme.navigationTheme.backgoundColor,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      // backgroundColor: context.appTheme.navigationTheme.backgoundColor,
      body: child,
      drawer: Drawer(
        backgroundColor: context.appTheme.navigationTheme.backgoundColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: Image.asset("assets/img/logo_dark.png"),
            ),
            ListTile(
              visualDensity: VisualDensity.comfortable,
              leading: SvgPicture.asset(
                state.fullPath == "/dashboard" ? "assets/icons/dashboard.svg" : "assets/icons/dashboard_outline.svg",
                width: 24,
                height: 24,
              ),
              title: Text(
                "Dashboard",
                style: context.appTheme.buttonextStyle.copyWith(fontSize: 16),
              ),
              selected: state.fullPath == "/dashboard",
              onTap: () {
                context.go("/dashboard");
                _scaffoldKey.currentState!.closeDrawer();
              },
            ),
            ListTile(
              visualDensity: VisualDensity.comfortable,
              leading: SvgPicture.asset(
                state.fullPath == "/people" ? "assets/icons/people.svg" : "assets/icons/people_outline.svg",
                width: 24,
                height: 24,
              ),
              title: Text(
                t.people.lable,
                style: context.appTheme.buttonextStyle.copyWith(fontSize: 16),
              ),
              selected: state.fullPath == "/people",
              onTap: () {
                context.go("/people");
                _scaffoldKey.currentState!.closeDrawer();
              },
            ),
            ListTile(
              visualDensity: VisualDensity.comfortable,
              leading: SvgPicture.asset(
                state.fullPath == "/service" ? "assets/icons/service.svg" : "assets/icons/service_outline.svg",
                width: 24,
                height: 24,
              ),
              title: Text(
                t.services.label,
                style: context.appTheme.buttonextStyle.copyWith(fontSize: 16),
              ),
              selected: state.fullPath == "/service",
              onTap: () {
                context.go("/service");
                _scaffoldKey.currentState!.closeDrawer();
              },
            ),
            ListTile(
              visualDensity: VisualDensity.comfortable,
              leading: SvgPicture.asset(
                state.fullPath == "/calendar" ? "assets/icons/calendar.svg" : "assets/icons/calendar_outline.svg",
                width: 24,
                height: 24,
              ),
              title: Text(
                "Calendar",
                style: context.appTheme.buttonextStyle.copyWith(fontSize: 16),
              ),
              selected: state.fullPath == "/calendar",
              onTap: () {
                context.go("/calendar");
                _scaffoldKey.currentState!.closeDrawer();
              },
            ),
            ListTile(
              visualDensity: VisualDensity.comfortable,
              leading: SvgPicture.asset(
                state.fullPath == "/calculator" ? "assets/icons/calculator.svg" : "assets/icons/calculator_outline.svg",
                width: 24,
                height: 24,
              ),
              title: Text(
                "Calculator",
                style: context.appTheme.buttonextStyle.copyWith(fontSize: 16),
              ),
              selected: state.fullPath == "/calculator",
              onTap: () {
                context.go("/calculator");
                _scaffoldKey.currentState!.closeDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }

  String getAppBarTitle() {
    if (state.fullPath == "/dashboard") return "Dashboard";
    if (state.fullPath == "/people") return t.people.lable;
    if (state.fullPath == "/service") return t.services.label;
    if (state.fullPath == "/calendar") return "Calendar";
    if (state.fullPath == "/calculator") return "Calculator";

    return "";
  }
}
