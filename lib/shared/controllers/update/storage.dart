import 'package:get_storage/get_storage.dart';

final class UpdateStorage {
  static const String _boxName = 'version';

  static const String _versionKey = 'version';

  static late GetStorage _box;

  static String? get version => _version;

  static String? _version;

  static Future<void> init() async {
    await GetStorage.init(_boxName);
    _box = GetStorage(_boxName);

    _version = _box.read(_versionKey);
  }

  static Future<void> saveNewVersion(String version) async {
    _version = version;
    await _box.write(_versionKey, version);
  }
}
