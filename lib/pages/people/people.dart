import 'package:admin_page/pages/people/people_landscape.dart';
import 'package:flutter/material.dart';
import 'people_portrait.dart';

class People extends StatelessWidget {
  const People({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).shortestSide < 600) return const PeoplePortrait();

    return const PeopleLandscape();
  }
}
