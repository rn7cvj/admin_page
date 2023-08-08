import 'dart:developer';

import 'package:admin_page/features/services/services.dart';
import 'package:admin_page/features/staff/staff.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(navigatorKey: _rootNavigatorKey, initialLocation: "/staff", routes: [
  ShellRoute(
    builder: (context, state, child) {
      // return ScaffoldWithNavBar(child: child);
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
]);
