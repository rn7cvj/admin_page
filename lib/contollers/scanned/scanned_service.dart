// import 'dart:async';
// import 'dart:convert';

// import 'package:chopper/chopper.dart';

// @ChopperApi()
// abstract class ScannedService extends ChopperService {
//   Future<ScanTokenResponse> tryToLogin(String email, String password) async {
//     Response response = (await _tryToLogin(email, password));
//     return await converScanTokenResponse(response);
//   }

//   static ScannedService create([ChopperClient? client]) => _$ScannedService(client);
// }

// class ScanTokenResponse {
//   late bool isSuccess;

//   String? userId;
// }

// Future<ScanTokenResponse> converScanTokenResponse(Response res){



// }
