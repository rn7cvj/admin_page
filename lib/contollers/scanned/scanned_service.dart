import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
part '../../gen/contollers/scanned/scanned_service.chopper.dart';

@ChopperApi()
abstract class ScannedService extends ChopperService {
  Future<ScanTokenBackendResponse> scanQr(String qrToken) async {
    Response response = (await _scanQr(qrToken));
    return converScanTokenResponse(response);
  }

  @Post(path: "/qr/scan")
  Future<Response> _scanQr(@Field("qr_token") String qrToken);

  static ScannedService create([ChopperClient? client]) => _$ScannedService(client);
}

class ScanTokenBackendResponse {
  late bool isSuccess;

  String? userId;
}

Future<ScanTokenBackendResponse> converScanTokenResponse(Response res) async {
  if (!res.isSuccessful) {
    return ScanTokenBackendResponse()..isSuccess = false;
  }
  String jsonBody = const Utf8Decoder().convert(res.bodyBytes);
  dynamic json = jsonDecode(jsonBody);

  ScanTokenBackendResponse response = ScanTokenBackendResponse()
    ..isSuccess = true
    ..userId = json["user_id"].toString();

  return response;
}
