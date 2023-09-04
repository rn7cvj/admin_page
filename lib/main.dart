import 'dart:async';

import 'package:admin_page/backend_connections/auth.dart';
import 'package:admin_page/controllers/auth.dart';
import 'package:admin_page/controllers/people.dart';
import 'package:admin_page/features/people/people.dart';
import 'package:admin_page/features/themes/app_theme.dart';
import 'package:admin_page/router.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';

import 'backend_connections/authenticator.dart';
import 'backend_connections/people.dart';

void setUpSystemUIOverlay() {
  WidgetsFlutterBinding.ensureInitialized();

  // Setting SysemUIOverlay
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: false,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent));
  // Setting SystmeUIMode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Future.delayed(Duration(seconds: 5), () => FlutterNativeSplash.remove());

  setUpSystemUIOverlay();

  GetIt.I.registerSingleton<AuthContoller>(AuthContoller());

  final chopper = ChopperClient(
    baseUrl: Uri.parse("https://fefufit.dvfu.ru/api2"),
    authenticator: CustomAuthenticator(),
    services: [
      PeopleService.create(),
      AuthService.create(),
    ],
    converter: const JsonConverter(),
  );

  GetIt.I.registerSingleton<PeopleService>(chopper.getService<PeopleService>());
  GetIt.I.registerSingleton<AuthService>(chopper.getService<AuthService>());

  GetIt.I.registerSingleton<PeopleContoller>(PeopleContoller());

  GetIt.I<AuthContoller>().init();

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
