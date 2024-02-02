import 'package:admin_page/mobile/navigation/router.dart';
import 'package:admin_page/shared/controllers/auth/controller.dart';
import 'package:admin_page/shared/controllers/token/token_storage.dart';
import 'package:admin_page/shared/controllers/user_data/controller.dart';
import 'package:admin_page/shared/logger.dart';
import 'package:get_it/get_it.dart';

class DIManager {
  static Future<void> init() async {
    FFSnackBarSystem.init(scaffoldKey);

    final TokenStorage tokenStorage = TokenStorage();
    await tokenStorage.init();
    g.registerSingleton<TokenStorage>(tokenStorage);

    final AuthController authController = AuthController();
    g.registerSingleton<AuthController>(authController);

    final UserDataController userDataController = UserDataController();
    g.registerSingleton<UserDataController>(userDataController);

    userDataController.getUserData();
  }

  static final GetIt g = GetIt.asNewInstance();

  static T get<T extends Object>() => g.get<T>();

  static T? getOrNull<T extends Object>() {
    if (g.isRegistered<T>()) g.get<T>();
    logger.e("Try to get non-existent: $T");
    return null;
  }

  static bool isExist<T extends Object>() {
    bool isExist = g.isRegistered<T>();

    if (!isExist) {
      logger.e("Try to find non-existent  $T");
    }

    return isExist;
  }
}
