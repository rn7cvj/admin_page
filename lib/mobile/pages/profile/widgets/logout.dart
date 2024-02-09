import 'package:admin_page/gen/i18n/strings.g.dart';
import 'package:admin_page/mobile/navigation/navigator.dart';
import 'package:admin_page/shared/controllers/di/manager.dart';
import 'package:admin_page/shared/controllers/token/token_storage.dart';
import 'package:fefufit_uikit/fefufit_uikit.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) =>
      FFMainButton(text: t.userpage.logout, onTap: _logout);

  void _logout() {
    DIManager.get<TokenStorage>().clearToken();
    AppNavigator.openAuth();
  }
}
