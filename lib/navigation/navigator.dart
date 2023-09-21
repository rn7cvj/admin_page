import 'package:admin_page/i18n/strings.g.dart';
import 'package:admin_page/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  static void goToHomePage() {
    // rootNavigatorKey.currentContext!.go("/dashboard");
    Router.neglect(rootNavigatorKey.currentContext!, () => rootNavigatorKey.currentContext!.go("/dashboard"));
  }

  static void goScannedPeron(String qrToken) {
    Router.neglect(rootNavigatorKey.currentContext!,
        () => rootNavigatorKey.currentContext!.goNamed(t.scanned.label, pathParameters: {"qrToken": qrToken}));
  }

  static void goScanner() {
    Router.neglect(rootNavigatorKey.currentContext!, () => rootNavigatorKey.currentContext!.goNamed(t.scanner.label));
  }

  static void goUserPage(String userId) {
    // GoRouter.of(rootNavigatorKey.currentContext!).push('/people/page/$userId');
    Router.neglect(rootNavigatorKey.currentContext!,
        () => rootNavigatorKey.currentContext!.goNamed(t.userpage.label, pathParameters: {"userId": userId}));
  }
}
