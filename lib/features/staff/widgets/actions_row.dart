import 'package:admin_page/features/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ActionsRow extends StatelessWidget {
  const ActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ActionButton(
              lable: "Сортировки",
              onPressed: () {},
              icon: const Icon(Icons.sort),
            ),
            VerticalDivider(
              width: 16,
            ),
            ActionButton(
              lable: "Фильтры",
              onPressed: () {},
              icon: const Icon(Icons.filter_alt),
            ),
          ],
        ),
        ActionButton(
          lable: "Скачать",
          onPressed: () {},
          icon: const Icon(Icons.download),
        ),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.lable,
    required this.onPressed,
    required this.icon,
  });

  final String lable;
  final VoidCallback onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.appTheme.buttonColor),
          iconColor: MaterialStateProperty.all(context.appTheme.buttonIconColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          visualDensity: VisualDensity.comfortable),
      onPressed: onPressed,
      icon: icon,
      label: Text(lable, style: context.appTheme.buttonextStyle),
    );
  }
}
