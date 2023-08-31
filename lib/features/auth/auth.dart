import 'package:admin_page/features/auth/widgets/auth_buttons.dart';
import 'package:admin_page/features/auth/widgets/logo.dart';
import 'package:admin_page/features/themes/app_theme.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.appTheme.authTheme.authBackgroundColor,
      child: Row(
        children: [
          const Expanded(flex: 1, child: Logo()),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(128),
              child: AuthButtons(),
            ),
          ),
        ],
      ),
    );
  }
}
