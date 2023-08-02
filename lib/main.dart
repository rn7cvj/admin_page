import 'package:admin_page/features/admin_console/admin_console.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AdminConsole(),
      debugShowCheckedModeBanner: false,
    );
  }
}