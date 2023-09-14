import 'package:admin_page/pages/services/services_landscape.dart';
import 'package:admin_page/pages/services/services_portrait.dart';
import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).shortestSide < 600) return const ServicesPortrait();

    return const ServicesLandscape();
  }
}
