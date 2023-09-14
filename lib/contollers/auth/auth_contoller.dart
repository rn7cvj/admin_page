import 'dart:async';

import 'package:mobx/mobx.dart';

import 'auth_convertor.dart';

part '../../gen/contollers/auth/auth_contoller.g.dart';

class AuthController = AuthContollerStore with _$AuthController;

abstract class AuthContollerStore with Store {
  AuthContollerStore({required AuthConvertor authConvertor}) : _authConvertor = authConvertor;

  final AuthConvertor _authConvertor;

  final StreamController<AuthMessage> messageStream = StreamController<AuthMessage>.broadcast();

  List<Future<void> Function(AuthResponse response)> onSuccess = [];
  List<Future<void> Function(AuthResponse response)> onSuccessAwait = [];

  @observable
  bool isLoading = false;

  @action
  Future<void> tryToLogin(String email, String password) async {
    isLoading = true;

    AuthResponse response = await _tryToLogin(email, password);

    if (response.status == AuthResponseStatus.newtworkTrouble ||
        response.status == AuthResponseStatus.serverInaccessible) {
      messageStream.add(AuthMessage(type: AuthMessageType.warning, data: AuthMessageData.networkTrouble));
    }

    if (response.status == AuthResponseStatus.wrongData) {
      messageStream.add(AuthMessage(type: AuthMessageType.info, data: AuthMessageData.wrongData));
    }

    if (response.status == AuthResponseStatus.success) {
      await Future.wait(onSuccessAwait.map((f) => f(response)));
    }

    Future.wait(onSuccess.map((f) => f(response)));

    isLoading = false;
  }

  Future<AuthResponse> _tryToLogin(String email, String password) async {
    AuthResponse response = await _authConvertor.tryToLogin(email, password);

    return response;
  }
}

class AuthMessage {
  final AuthMessageType type;
  final AuthMessageData data;

  AuthMessage({required this.type, required this.data});
}

enum AuthMessageType { warning, info }

enum AuthMessageData { wrongData, networkTrouble }
