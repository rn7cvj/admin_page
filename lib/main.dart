import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:admin_page/router.dart';
import 'package:admin_page/logger.dart';
import 'package:admin_page/themes/app_theme.dart';
import 'package:admin_page/contollers/auth/auth_service.dart';
import 'package:admin_page/contollers/auth/auth_contoller.dart';
import 'package:admin_page/contollers/auth/auth_convertor.dart';
import 'package:admin_page/contollers/token/token_contoller.dart';
import 'package:admin_page/contollers/token/token_convetor.dart';
import 'package:admin_page/contollers/token/token_service.dart';
import 'package:admin_page/contollers/token/token_storage.dart';

import 'navigation/navigator.dart';

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

Future<void> main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Future.delayed(Duration(seconds: 5), () => FlutterNativeSplash.remove());

  setUpSystemUIOverlay();

  // GetIt.I.registerSingleton<AuthContoller>(AuthContoller());

  final chopper = ChopperClient(
    baseUrl: Uri.parse("https://fefufit.dvfu.ru/api2"),
    // authenticator: CustomAuthenticator(),
    services: [
      AuthService.create(),
      TokenService.create(),
    ],
    converter: const JsonConverter(),
  );

  TokenConvertor tokenConvertor = TokenConvertor(tokenService: chopper.getService<TokenService>());
  TokenStorage tokenStorage = TokenStorage();
  await tokenStorage.init();
  TokenContoller tokenContoller = TokenContoller(tokenConvertor: tokenConvertor, tokenStorage: tokenStorage);
  tokenContoller.onSuccessAwait.add((response) async => logger.i(response));
  // tokenContoller.onSuccessAwait.add((response) async => AppNavigator.goToHomePage());

  await tokenContoller.init();

  AuthConvertor authConvertor = AuthConvertor(authService: chopper.getService<AuthService>());
  AuthController authController = AuthController(authConvertor: authConvertor);

  authController.onSuccessAwait.add((response) async {
    if (response.token != null && response.refreshToken != null) {
      logger.i("Write new token");
      tokenContoller.writeNewToken(response.token!, response.refreshToken!);
    }
  });
  authController.onSuccessAwait.add((response) async => AppNavigator.goToHomePage());

  GetIt.I.registerSingleton(authController);
  GetIt.I.registerSingleton(tokenContoller);

  // GetIt.I.registerSingleton<PeopleService>(chopper.getService<PeopleService>());
  // GetIt.I.registerSingleton<AuthService>(chopper.getService<AuthService>());

  // GetIt.I.registerSingleton<PeopleContoller>(PeopleContoller());

  // GetIt.I<AuthContoller>().init();

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
      themeMode: ThemeMode.light,
      theme: _lightTheme,
      darkTheme: _darkTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
