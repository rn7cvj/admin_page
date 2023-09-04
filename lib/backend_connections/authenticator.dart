import 'dart:async';

import 'package:admin_page/controllers/auth.dart';
import 'package:chopper/chopper.dart';
import 'package:get_it/get_it.dart';

class CustomAuthenticator extends Authenticator {
  AuthContoller authContoller = GetIt.I<AuthContoller>();

  @override
  FutureOr<Request?> authenticate(Request request, Response response, [Request? originalRequest]) {
    if (response.statusCode != 401) return null;

    String newToken = authContoller.token ?? "";

    final Map<String, String> updatedHeaders = request.headers;
    updatedHeaders["auth"] = newToken;

    return request.copyWith(headers: updatedHeaders);
  }
}
