import 'package:admin_page/mobile/navigation/navbar_wrapper.dart';
import 'package:admin_page/mobile/navigation/routes_name.dart';
import 'package:admin_page/mobile/pages/auth/auth.dart';
import 'package:admin_page/mobile/pages/calendar/calendart.dart';
import 'package:admin_page/mobile/pages/dashboard/dashboard.dart';
import 'package:admin_page/mobile/pages/home/home.dart';
import 'package:admin_page/mobile/pages/profile/profile.dart';
import 'package:admin_page/mobile/pages/restore_password/restore_password.dart';
import 'package:admin_page/shared/controllers/di/manager.dart';
import 'package:admin_page/shared/controllers/token/token_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigationKey =
    GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

final GoRouter router = GoRouter(
  routerNeglect: true,
  navigatorKey: rootNavigatorKey,
  initialLocation: RoutesName.home.fullPath,
  redirect: (context, state) {
    final token = DIManager.get<TokenStorage>().token;

    if (token == null) {
      return RoutesName.auth.fullPath;
    }

    return null;
  },
  routes: [
    ShellRoute(
      navigatorKey: shellNavigationKey,
      builder: (context, state, child) => Material(
        key: scaffoldKey,
        child: child,
      ),
      routes: [
        GoRoute(
          path: RoutesName.auth.reletivePath,
          name: RoutesName.auth.name,
          pageBuilder: (context, state) => MaterialPage(child: AuthPage()),
          routes: [
            GoRoute(
              path: RoutesName.restorePassword.reletivePath,
              name: RoutesName.restorePassword.name,
              pageBuilder: (context, state) =>
                  const CupertinoPage(child: RestorePasswordPage()),
            ),
          ],
        ),
        ShellRoute(
          builder: (context, state, child) => NavbarWrapper(
            state: state,
            child: child,
          ),
          routes: [
            GoRoute(
              path: RoutesName.home.reletivePath,
              name: RoutesName.home.name,
              builder: (context, state) => HomePage(),
              routes: [
                GoRoute(
                  path: RoutesName.profile.reletivePath,
                  name: RoutesName.profile.name,
                  pageBuilder: (context, state) =>
                      const CupertinoPage(child: ProfilePage()),
                )
              ],
            ),
            GoRoute(
              path: RoutesName.calendar.reletivePath,
              name: RoutesName.calendar.name,
              builder: (context, state) => const CalendarPage(),
            ),
            GoRoute(
              path: RoutesName.dashboard.reletivePath,
              name: RoutesName.dashboard.name,
              builder: (context, state) => const DashboardPage(),
            ),
          ],
        )
      ],
    ),
  ],
);
