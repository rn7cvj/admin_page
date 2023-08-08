import 'package:admin_page/features/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'widgets/navigation_rail.dart';

class ScaffoldWithNavigationRails extends StatelessWidget {
  const ScaffoldWithNavigationRails({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.navigationTheme.backgoundColor,
      body: Row(children: [
        CustomNavigationRail(),
        Expanded(child: child),
      ]),
    );
  }
}
