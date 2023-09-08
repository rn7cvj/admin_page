import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:admin_page/themes/app_theme.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.selectedSvgPath,
    required this.unselectedSvgPath,
    required this.isSelected,
    required this.onTap,
  });

  final String selectedSvgPath;
  final String unselectedSvgPath;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Color borderColor = Colors.transparent;

    if (isSelected) borderColor = context.appTheme.navigationTheme.indicatorColor;

    return InkWell(
      onTap: onTap,
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
            isSelected ? selectedSvgPath : unselectedSvgPath,
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
