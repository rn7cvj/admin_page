import 'package:admin_page/features/services/services.dart';
import 'package:flutter/material.dart';
import 'features/staff/staff.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Services(),
      debugShowCheckedModeBanner: false,
    );
  }
}
