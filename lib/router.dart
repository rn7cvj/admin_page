import 'package:admin_page/contollers/token/token_contoller.dart';
import 'package:admin_page/i18n/strings.g.dart';
import 'package:admin_page/navigation/scaffold_with_drawer.dart';
import 'package:admin_page/pages/auth/auth.dart';
import 'package:admin_page/pages/calendar/calendar.dart';
import 'package:admin_page/pages/people/people.dart';
import 'package:admin_page/pages/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'navigation/scaffold_with_rail.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigationKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  routerNeglect: true,
  navigatorKey: rootNavigatorKey,
  initialLocation: "/dashboard",
  redirect: (context, state) {
    TokenContoller tokenContoller = GetIt.I<TokenContoller>();
    if (tokenContoller.token != null) return null;
    return "/auth";
  },
  routes: [
    GoRoute(
      path: "/auth",
      builder: (context, state) => Auth(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigationKey,
      builder: (context, state, child) {
        if (MediaQuery.sizeOf(context).shortestSide < 600) {
          return ScaffoldWithDrawer(
            state: state,
            child: child,
          );
        }

        return ScaffoldWithNavigationRails(
          state: state,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: "/dashboard",
          name: "Dashboard",
          builder: (context, state) => const Placeholder(),
        ),
        GoRoute(
          path: "/people",
          name: t.people.lable,
          builder: (context, state) => People(),
        ),
        GoRoute(
          path: "/service",
          name: t.services.label,
          builder: (context, state) => const Services(),
        ),
        GoRoute(
          path: "/calendar",
          name: "Calendar",
          builder: (context, state) => const Placeholder(),
        ),
        GoRoute(
          path: "/calculator",
          name: "Calculator",
          builder: (context, state) => const Placeholder(),
        ),
      ],
    ),
  ],
);
