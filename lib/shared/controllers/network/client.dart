import 'package:admin_page/shared/controllers/auth/servicer.dart';
import 'package:admin_page/shared/controllers/network/authenticator.dart';
import 'package:admin_page/shared/controllers/network/inetceptor.dart';
import 'package:admin_page/shared/controllers/update/service.dart';
import 'package:admin_page/shared/controllers/user_data/service.dart';
import 'package:chopper/chopper.dart';

ChopperClient chopper = ChopperClient(
  baseUrl: Uri.parse("https://fefufit.ru/api2"),
  authenticator: TokenAuthenticator(),
  interceptors: [
    tokenInterceptor,
    loggerRequestInterceptor,
  ],
  services: [
    AuthService.create(),
    UpdateService.create(),
    UserDataService.create(),
  ],
  converter: const JsonConverter(),
);
