import 'package:admin_page/contollers/auth/auth_contoller.dart';
import 'package:admin_page/pages/auth/widgets/text_field.dart';
import 'package:admin_page/themes/app_theme.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AuthButtons extends StatelessWidget {
  AuthButtons({super.key, required this.email, required this.password});
  final _formKey = GlobalKey<FormState>();

  final AuthController controller = GetIt.I<AuthController>();

  final TextEditingController email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
            child: Text(
              "Авторизация",
              style: context.appTheme.authTheme.lableTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
            child: Text(
              "E-mail или телефон",
              style: context.appTheme.authTheme.titleTextStyle,
            ),
          ),
          SizedBox(
            width: 320,
            child: CustomTextField(
              obscureText: false,
              controller: email,
              validator: (value) {
                if (value == null || value.isEmpty) return "Введите почту";
                if (!EmailValidator.validate(value)) return "Введите корректную почту";
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
            child: Text(
              "Пароль",
              style: context.appTheme.authTheme.titleTextStyle,
            ),
          ),
          SizedBox(
            width: 320,
            child: CustomTextField(
              obscureText: true,
              controller: password,
              validator: (value) => null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {},
              child: Text(
                "Забыли пароль?",
                style: context.appTheme.authTheme.forgetPasswordTextStyle,
              ),
            ),
          ),
          Observer(
            builder: (_) {
              return Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(
                  onPressed: controller.isLoading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            // logger.i("Form is valid");
                            controller.tryToLogin(email.text, password.text);
                            return;
                          }
                          // logger.i("Form is invalid");
                        },
                  style: context.appTheme.authTheme.loginButtonStyle,
                  child: SizedBox(
                    width: 275,
                    height: 60,
                    child: Center(
                      child: controller.isLoading
                          ? LoadingAnimationWidget.prograssiveDots(color: Color.fromRGBO(67, 67, 244, 1), size: 60)
                          : Text(
                              "Войти",
                              style: context.appTheme.authTheme.loginButtonTextStyle,
                            ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
