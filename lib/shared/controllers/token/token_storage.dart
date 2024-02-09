import 'package:admin_page/shared/logger.dart';
import 'package:get_storage/get_storage.dart';

class TokenStorage {
  late GetStorage _box;

  static const String _boxName = "tokenBox";

  String? get token => _token;
  String? _token;
  static const String _tokenName = "token";

  String? get refreshToken => _refreshToken;
  String? _refreshToken;
  static const String _refreshTokenName = "refreshToken";

  String? get qrToken => _qrToken;
  String? _qrToken;
  static const String _qrTokenName = "qrToken";

  Future<void> init() async {
    if (!await GetStorage.init(_boxName)) return;
    _box = GetStorage(_boxName);

    _token = _box.read(_tokenName);
    _qrToken = _box.read(_qrTokenName);
    _refreshToken = _box.read(_refreshTokenName);

    logger.i("Restore\ntoken: $_token\nrefreshToken: $_refreshToken");
  }

  Future<void> writeNewToken(
    String token,
    String qrToken,
    String refreshToken,
  ) async {
    _token = token;
    _qrToken = qrToken;
    _refreshToken = refreshToken;

    await _box.write(_tokenName, _token);
    await _box.write(_qrTokenName, qrToken);
    await _box.write(_refreshTokenName, _refreshToken);

    logger.i(
      "Write\n\ttoken: $_token\n\trefreshToken: $_refreshToken \n\tqrToken: $_qrToken",
    );
  }

  Future<void> clearToken() async {
    _token = null;
    _refreshToken = null;

    await _box.remove(_tokenName);
    await _box.remove(_qrTokenName);
    await _box.remove(_refreshTokenName);

    logger.i(
      "Write\n\ttoken: $_token\n\trefreshToken: $_refreshToken \n\tqrToken: $_qrToken",
    );
  }
}
