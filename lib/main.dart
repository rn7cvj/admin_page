import 'package:admin_page/features/services/services.dart';
import 'package:admin_page/features/themes/app_theme.dart';
import 'package:admin_page/router.dart';
import 'package:flutter/material.dart';
import 'features/people/people.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final _lightTheme = ThemeData(
    brightness: Brightness.light,
    extensions: [AppTheme.light],
  );

  final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    extensions: [AppTheme.dark],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: _lightTheme,
      darkTheme: _darkTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
