import 'package:admin_page/shared/logger.dart';
import 'package:get_it/get_it.dart';

class ConverterProvider {
  static final GetIt g = GetIt.asNewInstance();

  static Future<void> init(List<ConverterBase> converters) async {
    for (var converter in converters) {
      g.registerSingleton(converter);
    }
  }

  static T get<T extends ConverterBase>() {
    return g.get<T>();
  }

  static T? getOrNull<T extends ConverterBase>() {
    if (g.isRegistered<T>()) g.get<T>();
    logger.e("Try to get non-existent converter: ${T.runtimeType}");
    return null;
  }

  static bool isConverterExist<T extends ConverterBase>() {
    bool isExist = g.isRegistered<T>();

    if (!isExist) {
      logger.e("Try to find non-existent converter: ${T.runtimeType}");
    }

    return isExist;
  }
}

interface class ConverterBase {}
