import 'package:admin_page/mobile/pages/profile/widgets/appbar.dart';
import 'package:admin_page/mobile/pages/profile/widgets/logout.dart';
import 'package:fefufit_uikit/fefufit_uikit.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ffPaddingMedium),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
