import 'dart:async';

import 'package:admin_page/contollers/people/people_controller.dart';
import 'package:admin_page/contollers/people/people_convertor.dart';
import 'package:admin_page/contollers/people/people_service.dart';
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

class CustomAuthenticator extends Authenticator {
  @override
  FutureOr<Request?> authenticate(Request request, Response response, [Request? originalRequest]) {
    if (response.statusCode != 401) return null;

    TokenContoller tokenContoller = GetIt.I<TokenContoller>();

    String newToken = tokenContoller.token ?? "";

    final Map<String, String> updatedHeaders = request.headers;
    updatedHeaders["auth"] = newToken;

    return request.copyWith(headers: updatedHeaders);
  }
}

Future<void> main() async {
  setUpSystemUIOverlay();

  final chopper = ChopperClient(
    baseUrl: Uri.parse("https://fefufit.dvfu.ru/api2"),
    authenticator: CustomAuthenticator(),
    services: [
      AuthService.create(),
      TokenService.create(),
      PeopleService.create(),
    ],
    converter: const JsonConverter(),
  );

  PeopleConvertor peopleConvertor = PeopleConvertor(peopleService: chopper.getService<PeopleService>());
  PeopleContoller peopleContoller = PeopleContoller(peopleConvertor: peopleConvertor);

  GetIt.I.registerSingleton(peopleContoller);

  TokenConvertor tokenConvertor = TokenConvertor(tokenService: chopper.getService<TokenService>());
  TokenStorage tokenStorage = TokenStorage();
  await tokenStorage.init();
  TokenContoller tokenContoller = TokenContoller(tokenConvertor: tokenConvertor, tokenStorage: tokenStorage);
  tokenContoller.onSuccessAwait.add((response) async {
    logger.i("Token sucsessfully restore\n$response");
  });
  tokenContoller.onSuccess.add((response) async {
    peopleContoller.init();
  });
  // tokenContoller.onSuccessAwait.add((response) async => AppNavigator.goToHomePage());

  await tokenContoller.init();

  AuthConvertor authConvertor = AuthConvertor(authService: chopper.getService<AuthService>());
  AuthController authController = AuthController(authConvertor: authConvertor);

  authController.onSuccessAwait.add((response) async {
    if (response.token != null && response.refreshToken != null) {
      logger.i("Save new token\n");
      tokenContoller.writeNewToken(response.token!, response.refreshToken!);
    }
  });
  authController.onSuccessAwait.add((response) => peopleContoller.init());
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
      title: "FefuFit Admin",
      themeMode: ThemeMode.light,
      theme: _lightTheme,
      darkTheme: _darkTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
