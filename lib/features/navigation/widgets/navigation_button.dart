import 'package:admin_page/features/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({super.key, required this.svgPath, required this.isSelected});

  final String svgPath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    Color borderColor = Colors.transparent;

    if (isSelected) borderColor = context.appTheme.navigationTheme.indicatorColor;

    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              width: 5,
              color: borderColor,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            svgPath,
            colorFilter: ColorFilter.mode(
              context.appTheme.navigationTheme.iconColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
