import 'package:admin_page/themes/app_theme.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:admin_page/pages/auth/widgets/logo.dart';
import 'package:admin_page/contollers/auth/auth_contoller.dart';
import 'package:admin_page/pages/auth/widgets/auth_buttons.dart';

class AuthLandscape extends StatelessWidget {
  AuthLandscape({super.key});

  final AuthController _controller = GetIt.I<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.appTheme.authTheme.authBackgroundColor,
      child: Row(
        children: [
          const Expanded(flex: 1, child: Logo()),
          Expanded(
            flex: 2,
            child: Scaffold(
              body: Builder(
                builder: (context) {
                  _controller.messageStream.stream.listen(
                    (message) => showSnackBar(context, message),
                  );

                  return Padding(
                    padding: const EdgeInsets.all(128),
                    child: AuthButtons(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
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
