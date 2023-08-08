import 'package:admin_page/features/services/services.dart';
import 'package:admin_page/features/staff/staff.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'features/navigation/scaffold_with_rail.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigationKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/staff",
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigationKey,
      builder: (context, state, child) {
        return ScaffoldWithNavigationRails(child: child);
      },
      routes: [
        GoRoute(
          path: "/staff",
          builder: (context, state) => const Staff(),
        ),
        GoRoute(
          path: "/services",
          builder: (context, state) => const Services(),
        ),
      ],
    ),
  ],
);
