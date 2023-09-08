import 'package:admin_page/router.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  static void goToHomePage() {
    rootNavigatorKey.currentContext!.goNamed("/calendar");
  }
}
