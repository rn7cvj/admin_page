import 'package:admin_page/controllers/auth.dart';
import 'package:admin_page/features/auth/auth.dart';
import 'package:admin_page/features/services/services.dart';
import 'package:admin_page/features/people/people.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'features/calendar/calendar.dart';
import 'features/navigation/scaffold_with_rail.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigationKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/calendar",
  // redirect: (context, state) {
  //   AuthContoller authContoller = GetIt.I<AuthContoller>();
  //   if (authContoller.token != null) return null;
  //   return "/auth";
  // },
  routes: [
    GoRoute(
      path: "/auth",
      builder: (context, state) => const Auth(),
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
        GoRoute(
          path: "/people",
          builder: (context, state) => const People(),
        ),
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
