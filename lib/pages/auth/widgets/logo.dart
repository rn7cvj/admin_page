import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:admin_page/themes/app_theme.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constrains) {
          return Container(
            color: context.appTheme.authTheme.logoBackgoundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/logo.svg",
                  width: constrains.maxWidth * 0.5,
                ),
                const SizedBox(height: 16),
                SvgPicture.asset(
                  "assets/icons/admin_mode_panel.svg",
                  width: constrains.maxWidth * 0.5,
                ),
              ],
            ),
          );
        },
      );
}
