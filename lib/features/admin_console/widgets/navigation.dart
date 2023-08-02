import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Navigation extends StatelessWidget {
  Navigation({super.key});

  final List<NavigationRailDestination> destinations = <NavigationRailDestination>[
    NavigationRailDestination(icon: SvgPicture.asset("assets/icons/statistic.svg"), label: Text("statistic")),
    NavigationRailDestination(icon: SvgPicture.asset("assets/icons/people.svg"), label: Text("people")),
    NavigationRailDestination(icon: SvgPicture.asset("assets/icons/finance.svg"), label: Text("finance")),
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationRail(destinations: destinations, selectedIndex: 1);
  }
}
