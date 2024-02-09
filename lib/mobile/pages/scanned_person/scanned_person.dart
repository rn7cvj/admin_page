import 'package:admin_page/gen/i18n/strings.g.dart';
import 'package:admin_page/mobile/navigation/navigator.dart';
import 'package:admin_page/mobile/navigation/router.dart';
import 'package:fefufit_uikit/fefufit_uikit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScannedPerson extends StatelessWidget {
  const ScannedPerson({super.key, required this.token});

  final String token;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ffPaddingMedium),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [],
            ),
          ),
          FFMinorButton(
            text: t.common.close,
            onTap: () => rootNavigatorKey.currentState!.pop(),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom + ffPaddingMedium,
          )
        ],
      ),
    );
  }
}
