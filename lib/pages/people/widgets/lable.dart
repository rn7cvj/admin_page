import 'package:admin_page/themes/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../i18n/strings.g.dart';

class Lable extends StatelessWidget {
  const Lable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          t.people.label,
          style: context.appTheme.lableTextStyle,
        ),
        CircleAvatar(
            backgroundColor: const Color.fromRGBO(67, 67, 244, 1),
            child: IconButton(color: Colors.white, onPressed: () {}, icon: const Icon(Icons.search))),
      ],
    );
  }
}
