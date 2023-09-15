import 'package:admin_page/i18n/strings.g.dart';
import 'package:admin_page/themes/app_theme.dart';
import 'package:admin_page/vibration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class ScaffoldWithDrawer extends StatelessWidget {
  ScaffoldWithDrawer({super.key, required this.child, required this.state});

  final Widget child;
  final GoRouterState state;

  // final VibrationController vibrationController = GetIt.I<VibrationController>();

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
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      // backgroundColor: context.appTheme.navigationTheme.backgoundColor,
      body: child,
      drawer: Drawer(
        backgroundColor: context.appTheme.navigationTheme.backgoundColor,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Image.asset("assets/img/logo_dark.png"),
                  ),
                  ListTile(
                    visualDensity: VisualDensity.comfortable,
                    leading: SvgPicture.asset(
                      state.fullPath == "/dashboard"
                          ? "assets/icons/dashboard.svg"
                          : "assets/icons/dashboard_outline.svg",
                      width: 24,
                      height: 24,
                    ),
                    title: Text(
                      t.dashboard.label,
                      style: context.appTheme.buttonextStyle.copyWith(fontSize: 16),
                    ),
                    selected: state.fullPath == "/dashboard",
                    onTap: () {
                      // context.go("/dashboard");
                      clearAndNavigate(context, "/dashboard");
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
                      t.people.label,
                      style: context.appTheme.buttonextStyle.copyWith(fontSize: 16),
                    ),
                    selected: state.fullPath == "/people",
                    onTap: () {
                      // context.go("/people");
                      clearAndNavigate(context, "/people");
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
                      // context.go("/service");
                      clearAndNavigate(context, "/service");
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
                      t.calendar.label,
                      style: context.appTheme.buttonextStyle.copyWith(fontSize: 16),
                    ),
                    selected: state.fullPath == "/calendar",
                    onTap: () {
                      // context.go("/calendar");
                      clearAndNavigate(context, "/calendar");
                      _scaffoldKey.currentState!.closeDrawer();
                    },
                  ),
                  ListTile(
                    visualDensity: VisualDensity.comfortable,
                    leading: SvgPicture.asset(
                      state.fullPath == "/calculator"
                          ? "assets/icons/calculator.svg"
                          : "assets/icons/calculator_outline.svg",
                      width: 24,
                      height: 24,
                    ),
                    title: Text(
                      t.calculator.label,
                      style: context.appTheme.buttonextStyle.copyWith(fontSize: 16),
                    ),
                    selected: state.fullPath == "/calculator",
                    onTap: () {
                      // context.go("/calculator");
                      clearAndNavigate(context, "/calculator");
                      _scaffoldKey.currentState!.closeDrawer();
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(bottom: 8.0, top: 8.0, left: 8.0, right: 8.0),
              titleAlignment: ListTileTitleAlignment.center,
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.people,
                      size: 24,
                    )),
              ),
              title: Text(
                "Тренер Тренерович",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),
              ),
              trailing: IconButton(
                onPressed: () {
                  clearAndNavigate(context, "/scanner");
                  _scaffoldKey.currentState!.closeDrawer();
                },
                icon: const Icon(
                  Icons.qr_code_scanner_outlined,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void clearAndNavigate(BuildContext context, String path) {
    // vibrationController.onTapVibraion();
    Router.neglect(context, () => context.go(path));
  }

  String getAppBarTitle() {
    if (state.fullPath == "/dashboard") return t.dashboard.label;
    if (state.fullPath == "/people") return t.people.label;
    if (state.fullPath == "/service") return t.services.label;
    if (state.fullPath == "/calendar") return t.calendar.label;
    if (state.fullPath == "/calculator") return t.calculator.label;
    if (state.fullPath == "/scanner") return t.scanner.label;
    if (state.fullPath?.startsWith("/scanned") ?? false) return t.scanned.label;

    return "";
  }
}
