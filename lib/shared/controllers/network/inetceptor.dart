import 'dart:async';
import 'dart:convert';

import 'package:admin_page/gen/i18n/strings.g.dart';
import 'package:admin_page/mobile/navigation/navigator.dart';
import 'package:admin_page/shared/controllers/di/manager.dart';
import 'package:admin_page/shared/controllers/token/token_storage.dart';
import 'package:admin_page/shared/logger.dart';
import 'package:chopper/chopper.dart';
import 'package:fefufit_uikit/fefufit_uikit.dart';

FutureOr<Request> loggerRequestInterceptor(Request request) {
  const jsonEncoder = JsonEncoder.withIndent('    ');

  String headers = jsonEncoder.convert(request.headers);
  // headers = headers.substring(1, headers.length - 2);

  String params = jsonEncoder.convert(request.parameters);
  // params = params.substring(1, params.length - 2);

  String body = jsonEncoder.convert(request.body);

  logger.i(
    '''Request
    Url: ${request.url}
    Method: ${request.method}
    Headers: $headers
    Params: $params
    Body: $body''',
  );

  return request;
}

FutureOr<Response> loggerResponseInterceptor(Response response) {
  const jsonEncoder = JsonEncoder.withIndent('    ');

  // String headers = jsonEncoder.convert(response.headers);
  // headers = headers.substring(1, headers.length - 2);

  String body = jsonEncoder.convert(response.body);

  logger.i(
    '''Response
    Url: ${response.base.request?.url.toString()}
    Status Code: ${response.statusCode}
    Body: $body''',
  );

  return response;
}

FutureOr<Request> tokenInterceptor(Request request) async {
  final token = DIManager.get<TokenStorage>().token;

  if (token == null) {
    logger.e("Token is null");
    return request;
  }

  final updateHeader = request.headers;
  updateHeader["auth"] = token;

  return request.copyWith(headers: updateHeader);
}

FutureOr<Response> autoLogoutInterceptor(Response response) {
  if (response.statusCode != 401) return response;

  logger.e("Token is expired or invalid");

  AppNavigator.openAuth();
  FFSnackBarSystem.showInfoSnackBar(
    t.auth.expiredTokenMessage,
    duration: const Duration(
      milliseconds: 300,
    ),
  );

  DIManager.get<TokenStorage>().clearToken();

  return response;
}
