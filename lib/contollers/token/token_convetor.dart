import 'package:admin_page/contollers/token/token_service.dart';

class TokenConvertor {
  TokenConvertor({required TokenService tokenService}) : _tokenService = tokenService;
  final TokenService _tokenService;

  Future<TokenResponse> tryToRefreshToken(String refreshToken) async {
    TokenBackendResponse? backendResponse;

    try {
      backendResponse = await _tokenService.tryToLRefreshToken(refreshToken);
    } catch (ex) {
      return TokenResponse(
        status: TokenResponseStatus.networkTrouble,
        newToken: null,
        newRefreshToken: null,
      );
    }

    // if (backendResponse == null) {
    //   return TokenResponse(
    //     status: TokenResponseStatus.networkTrouble,
    //     newToken: null,
    //     newRefreshToken: null,
    //   );
    // }

    if (!backendResponse.isSuccess) {
      return TokenResponse(
        status: TokenResponseStatus.tokenDeprecated,
        newToken: null,
        newRefreshToken: null,
      );
    }

    return TokenResponse(
      status: TokenResponseStatus.success,
      newToken: backendResponse.newToken,
      newRefreshToken: backendResponse.newRefreshToken,
    );
  }
}

class TokenResponse {
  final TokenResponseStatus status;

  final String? newToken;
  final String? newRefreshToken;

  TokenResponse({required this.status, required this.newToken, required this.newRefreshToken});

  @override
  String toString() {
    return "Status: ${status.name}\nToken: $newToken\nResfreshToken: $newRefreshToken";
  }
}

enum TokenResponseStatus { networkTrouble, tokenDeprecated, success }
