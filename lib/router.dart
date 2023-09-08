import 'package:admin_page/pages/auth/auth.dart';
import 'package:admin_page/pages/calendar/calendar.dart';
import 'package:admin_page/pages/services/services.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'navigation/scaffold_with_rail.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigationKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: "/auth",
  // redirect: (context, state) {
  //   AuthContoller authContoller = GetIt.I<AuthContoller>();
  //   if (authContoller.token != null) return null;
  //   return "/auth";
  // },
  routes: [
    GoRoute(
      path: "/auth",
      builder: (context, state) => Auth(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigationKey,
      builder: (context, state, child) {
        return ScaffoldWithNavigationRails(
          state: state,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: "/dashboard",
          builder: (context, state) => const Placeholder(),
        ),
        // GoRoute(
        //   path: "/people",
        //   builder: (context, state) => const People(),
        // ),
        GoRoute(
          path: "/service",
          builder: (context, state) => const Services(),
        ),
        GoRoute(
          path: "/calendar",
          builder: (context, state) => const Calendar(),
        ),
      ],
    ),
  ],
);
