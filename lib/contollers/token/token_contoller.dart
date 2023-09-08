import 'package:admin_page/contollers/token/token_convetor.dart';
import 'package:admin_page/contollers/token/token_storage.dart';

class TokenContoller {
  final TokenConvertor _tokenConvertor;
  final TokenStorage _tokenStorage;

  TokenContoller({required TokenConvertor tokenConvertor, required TokenStorage tokenStorage})
      : _tokenStorage = tokenStorage,
        _tokenConvertor = tokenConvertor;

  String? get token => _token;
  String? _token;
  String? get refreshToken => _refreshToken;
  String? _refreshToken;

  List<Future<void> Function(TokenResponse response)> onSuccess = [];
  List<Future<void> Function(TokenResponse response)> onSuccessAwait = [];

  Future<void> init() async {
    await _tokenStorage.init();

    // _token = _tokenStorage.token;
    _refreshToken = _tokenStorage.refreshToken;

    if (_refreshToken == null) return;

    TokenResponse response = await _tokenConvertor.tryToRefreshToken(_refreshToken!);

    if (response.status != TokenResponseStatus.success) return;

    _token = response.newToken;
    _refreshToken = response.newRefreshToken;

    _tokenStorage.writeNewToken(_token!, _refreshToken!);

    Future.wait(onSuccess.map((f) => f(response)));
    await Future.wait(onSuccessAwait.map((f) => f(response)));
  }

  void writeNewToken(String token, String refreshToken) {
    _token = token;
    _refreshToken = refreshToken;

    _tokenStorage.writeNewToken(_token!, _refreshToken!);
  }
}
