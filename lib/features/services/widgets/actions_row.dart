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
              lable: "Новая категория",
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            VerticalDivider(
              width: 16,
            ),
            ActionButton(
              lable: "Редактировать",
              onPressed: () {},
              icon: const Icon(Icons.edit_outlined),
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
          backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(67, 67, 244, 1)),
          iconColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          visualDensity: VisualDensity.comfortable),
      onPressed: onPressed,
      icon: icon,
      label: Text(lable, style: TextStyle(color: Colors.white)),
    );
  }
}
