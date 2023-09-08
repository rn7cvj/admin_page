import 'auth_service.dart';

class AuthConvertor {
  AuthConvertor({required AuthService authService}) : _authService = authService;

  final AuthService _authService;

  Future<AuthResponse> tryToLogin(String email, String password) async {
    AuthBackendResponse? backendResponse;
    try {
      backendResponse = await _authService.tryToLogin(email, password);
    } catch (ex) {
      return AuthResponse(
        status: AuthResponseStatus.newtworkTrouble,
        token: null,
        refreshToken: null,
      );
    }

    // if (backendResponse == null) {
    //   return AuthResponse(
    //     status: AuthResponseStatus.newtworkTrouble,
    //     token: null,
    //     refreshToken: null,
    //   );
    // }

    if (!backendResponse.isSuccess) {
      return AuthResponse(
        status: AuthResponseStatus.wrongData,
        token: null,
        refreshToken: null,
      );
    }

    if (backendResponse.refreshToken == null || backendResponse.token == null) {
      return AuthResponse(
        status: AuthResponseStatus.wrongData,
        token: null,
        refreshToken: null,
      );
    }

    return AuthResponse(
      status: AuthResponseStatus.success,
      token: backendResponse.token,
      refreshToken: backendResponse.refreshToken,
    );
  }
}

class AuthResponse {
  final AuthResponseStatus status;

  final String? token;
  final String? refreshToken;

  AuthResponse({required this.status, required this.token, required this.refreshToken});

  @override
  String toString() {
    return "Status: ${status.name}\nToken: $token\nRefreshToken: $refreshToken";
  }
}

enum AuthResponseStatus {
  newtworkTrouble,
  serverInaccessible,
  wrongData,
  success,
}
