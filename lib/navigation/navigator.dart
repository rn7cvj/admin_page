import 'package:admin_page/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  static void goToHomePage() {
    // rootNavigatorKey.currentContext!.go("/dashboard");
    Router.neglect(rootNavigatorKey.currentContext!, () => rootNavigatorKey.currentContext!.go("/dashboard"));
  }
}
