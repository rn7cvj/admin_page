import 'package:admin_page/gen/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:fefufit_uikit/fefufit_uikit.dart';

class QrToken extends StatelessWidget {
  const QrToken({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ffBorderRadiusMedium),
      ),
      color: context.ffTheme.color.mainControllColor,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 100,
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(ffBorderRadiusMedium),
          child: Padding(
            padding: const EdgeInsets.all(ffPaddingSmall),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.home.your_pass),
                Text(t.home.show_qr),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
