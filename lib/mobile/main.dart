import 'package:admin_page/mobile/navigation/router.dart';
import 'package:admin_page/shared/controllers/di/manager.dart';
import 'package:admin_page/shared/utils/ui.dart';
import 'package:flutter/material.dart';
import 'package:fefufit_uikit/fefufit_uikit.dart';

Future<void> main() async {
  setUpSystemUIOverlay();

  await DIManager.init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData lightTheme = ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: FFTheme.light.color.mainControllColor,
        brightness: Brightness.light,
      ),
    );

    lightTheme = lightTheme.copyWith(extensions: [FFTheme.light]);

    ThemeData darkTheme = ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: FFTheme.dark.color.mainControllColor,
        brightness: Brightness.dark,
      ),
    );

    darkTheme = darkTheme.copyWith(extensions: [FFTheme.dark]);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
