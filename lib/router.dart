import 'package:admin_page/features/services/services.dart';
import 'package:admin_page/features/people/people.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'features/navigation/scaffold_with_rail.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigationKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/people",
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigationKey,
      builder: (context, state, child) {
        return ScaffoldWithNavigationRails(
          child: child,
          state: state,
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
          builder: (context, state) => const Placeholder(),
        ),
      ],
    ),
  ],
);
