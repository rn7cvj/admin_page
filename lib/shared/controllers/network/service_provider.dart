import 'package:admin_page/shared/controllers/network/client.dart';
import 'package:admin_page/shared/logger.dart';
import 'package:chopper/chopper.dart';

class ServiceProvide {
  static T get<T extends ChopperService>() => chopper.getService<T>();

  static T? getOrNull<T extends ChopperService>() {
    try {
      return chopper.getService<T>();
    } catch (ex) {
      logger.e("Try to get non-existent service: ${T.runtimeType}");
      return null;
    }
  }

  static bool isServiceExist<T extends ChopperService>() {
    try {
      chopper.getService<T>();
      return true;
    } catch (ex) {
      logger.e("Try to find non-existent service: ${T.runtimeType}");
      return false;
    }
  }
}
