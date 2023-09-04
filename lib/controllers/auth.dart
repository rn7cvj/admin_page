import 'package:admin_page/logger.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../backend_connections/auth.dart';
import '../backend_connections/people.dart';
import '../models/person.dart';

part 'auth.g.dart';

class AuthContoller = AuthContollerStore with _$AuthContoller;

abstract class AuthContollerStore with Store {
  @observable
  bool isLoading = false;

  late AuthService backendConnection;

  void init() {
    backendConnection = GetIt.I<AuthService>();
  }

  @action
  Future<void> tryToLogin(String email, String password, VoidCallback onSuccess) async {
    isLoading = true;
    AuthResponse? response = await backendConnection.tryToLogin(email, password);

    if (response == null || !response.isSuccess) {
      isLoading = false;
      return;
    }
    isLoading = false;
    token = response.token;
    onSuccess();
  }

  String? token = null;
}
