import 'dart:async';
import 'dart:convert';

import 'package:admin_page/shared/controllers/di/manager.dart';
import 'package:admin_page/shared/controllers/token/token_storage.dart';
import 'package:admin_page/shared/logger.dart';
import 'package:chopper/chopper.dart';

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
