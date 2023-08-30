import 'dart:async';

import 'package:chopper/chopper.dart';

class CustomAuthenticator extends Authenticator {
  @override
  FutureOr<Request?> authenticate(Request request, Response response, [Request? originalRequest]) {
    if (response.statusCode != 401) return null;

    String newToken =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZXhwaXJlZCI6IjIwMjMtMTItMDkgMTE6MTg6NDMuODgzNzc2In0.wCcsQu_yc1K1q1fAKAg5XCPVI508OYzN85xzFb3awok";

    final Map<String, String> updatedHeaders = request.headers;
    updatedHeaders["auth"] = newToken;

    return request.copyWith(headers: updatedHeaders);
  }
}
