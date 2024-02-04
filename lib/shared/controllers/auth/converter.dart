import 'package:admin_page/shared/controllers/auth/servicer.dart';
import 'package:admin_page/shared/controllers/network/service_provider.dart';

class AuthConverter {
  static Future<AuthResponse> tryToLogin(String email, String password) async {
    AuthBackendResponse? backendResponse;
    try {
      backendResponse = await ServiceProvide.get<AuthService>().tryToLogin(
        email,
        password,
      );
    } catch (ex) {
      return AuthResponse(
        status: AuthResponseStatus.newtworkTrouble,
        token: null,
        refreshToken: null,
      );
    }

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

  AuthResponse({
    required this.status,
    required this.token,
    required this.refreshToken,
  });

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