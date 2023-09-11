import 'package:admin_page/pages/auth/auth_landscape.dart';
import 'package:admin_page/pages/auth/auth_portrait.dart';
import 'package:admin_page/themes/app_theme.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:admin_page/pages/auth/widgets/logo.dart';
import 'package:admin_page/contollers/auth/auth_contoller.dart';
import 'package:admin_page/pages/auth/widgets/auth_buttons.dart';

class Auth extends StatelessWidget {
  Auth({super.key});

  final AuthController _controller = GetIt.I<AuthController>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).shortestSide < 600) {
      return AuthPortrait(
        email: email,
        password: password,
      );
    }

    return AuthLandscape(
      email: email,
      password: password,
    );
  }

  void showSnackBar(BuildContext context, AuthMessage message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message.data.name),
      ),
    );
  }
}
