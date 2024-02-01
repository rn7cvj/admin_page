import 'package:admin_page/mobile/pages/home/widgets/appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeAppBar(),
        ],
      ),
    );
  }
}
