import 'package:admin_page/mobile/navigation/navigator.dart';
import 'package:admin_page/shared/controllers/auth/converter.dart';
import 'package:admin_page/shared/controllers/di/manager.dart';
import 'package:admin_page/shared/controllers/token/token_storage.dart';
import 'package:admin_page/shared/logger.dart';
import 'package:fefufit_uikit/fefufit_uikit.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:email_validator/email_validator.dart';

import '../../../gen/i18n/strings.g.dart';

part '../../../gen/shared/controllers/auth/controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return t.auth.emailRequired;

    if (!EmailValidator.validate(value)) return t.auth.emailInvalid;

    return null;
  }

  String? passwordvalidator(String? value) {
    if (value == null || value.isEmpty) return t.auth.passwordRequired;

    if (value.length < 6) return t.auth.passwordTooShort;

    return null;
  }

  @observable
  bool isLoading = false;

  @action
  Future<void> submit() async {
    isLoading = true;
    if (!formKey.currentState!.validate()) {
      logger.e("Auth form is not valid");
      isLoading = false;
      return;
    }

    final email = emailController.text;
    final password = passwordController.text;

    final response = await AuthConverter.tryToLogin(email, password);

    logger.i("Auth response:\n\n$response");

    if (response.status == AuthResponseStatus.success) {
      await _handelSuccess(response);
      isLoading = false;
      return;
    }

    await _handelError(response);
    isLoading = false;
  }

  Future<void> _handelSuccess(AuthResponse response) async {
    DIManager.get<TokenStorage>().writeNewToken(
      response.token!,
      response.qrToken!,
      response.refreshToken!,
    );
    AppNavigator.openHome();
  }

  Future<void> _handelError(AuthResponse response) async {
    String message = switch (response.status) {
      AuthResponseStatus.newtworkTrouble => t.auth.newtworkTroubleMessage,
      AuthResponseStatus.wrongData => t.auth.wrongDataMessage,
      AuthResponseStatus.serverInaccessible => t.auth.serverInaccessibleMessage,
      AuthResponseStatus.success => "",
    };

    FFSnackBarSystem.showInfoSnackBar(message);
  }
}
