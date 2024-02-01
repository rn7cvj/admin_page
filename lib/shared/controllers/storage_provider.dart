import 'package:admin_page/shared/logger.dart';
import 'package:get_it/get_it.dart';

class StorageProvider {
  static final GetIt g = GetIt.asNewInstance();

  static Future<void> init(List<StorageBase> converters) async {
    for (var converter in converters) {
      g.registerSingleton(converter);
    }
  }

  static T get<T extends StorageBase>() {
    return g.get<T>();
  }

  static T? getOrNull<T extends StorageBase>() {
    if (g.isRegistered<T>()) g.get<T>();
    logger.e("Try to get non-existent storage: ${T.runtimeType}");
    return null;
  }

  static bool isConverterExist<T extends StorageBase>() {
    bool isExist = g.isRegistered<T>();

    if (!isExist) {
      logger.e("Try to find non-existent storage: ${T.runtimeType}");
    }

    return isExist;
  }
}

interface class StorageBase {}
