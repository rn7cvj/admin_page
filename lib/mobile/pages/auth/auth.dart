import 'package:admin_page/gen/i18n/strings.g.dart';
import 'package:admin_page/mobile/navigation/navigator.dart';
import 'package:admin_page/shared/controllers/auth/controller.dart';
import 'package:admin_page/shared/controllers/di/manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fefufit_uikit/fefufit_uikit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final AuthController controller = DIManager.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(ffPaddingLarge),
          child: Column(
            children: [
              _AuthForm(),
              Align(
                alignment: Alignment.centerRight,
                child: FFMainTextButton(
                  onTap: AppNavigator.openRestorePassword,
                  text: t.auth.forgotPassword,
                ),
              ),
              const SizedBox(
                height: ffPaddingMedium,
              ),
              Observer(
                builder: (_) => FFMainButton(
                  text: t.auth.login,
                  onTap: controller.submit,
                  isLoading: controller.isLoading,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthForm extends StatelessWidget {
  _AuthForm();

  final AuthController controller = DIManager.get<AuthController>();

  @override
  Widget build(BuildContext context) => Form(
        key: controller.formKey,
        child: AutofillGroup(
          child: Column(
            children: [
              FFTextField(
                hint: t.auth.emailHint,
                controller: controller.emailController,
                validator: controller.emailValidator,
                autofillHints: const [AutofillHints.email],
                textInputAction: TextInputAction.next,
                formatters: [
                  FilteringTextInputFormatter.deny(' '),
                ],
                padding: EdgeInsets.zero,
              ),
              FFTextField(
                hint: t.auth.passwordHint,
                controller: controller.passwordController,
                validator: controller.passwordvalidator,
                isObscure: true,
                autofillHints: const [AutofillHints.password],
                textInputAction: TextInputAction.next,
                formatters: [
                  FilteringTextInputFormatter.deny(' '),
                ],
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
      );
}
