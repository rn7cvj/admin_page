import 'package:admin_page/mobile/navigation/router.dart';
import 'package:admin_page/mobile/navigation/routes_name.dart';
import 'package:fefufit_uikit/fefufit_uikit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class AppNavigator {
  static void _openNamed(String name) {
    Router.neglect(
      rootNavigatorKey.currentContext!,
      () => rootNavigatorKey.currentContext!.goNamed(name),
    );
  }

  // ignore: unused_element
  static void _openPath(String path) {
    Router.neglect(
      rootNavigatorKey.currentContext!,
      () => rootNavigatorKey.currentContext!.go(path),
    );
  }

  static void openAuth() => _openNamed(RoutesName.auth.name);

  static void openRestorePassword() =>
      _openNamed(RoutesName.restorePassword.name);

  static void openHome() => _openNamed(RoutesName.home.name);

  static void openCalendar() {
    FFSnackBarSystem.showInfoSnackBar("Calendar is not implemented yet");
    return;
    // TODO: uncomment this line when calendar is implemented
    // _openNamed(RoutesName.calendar.name);
  }

  static void openDashboard() {
    FFSnackBarSystem.showInfoSnackBar("Dashboard is not implemented yet");
    return;
    // TODO: uncomment this line when dashboard is implemented
    // _openNamed(RoutesName.dashboard.name);
  }
}
