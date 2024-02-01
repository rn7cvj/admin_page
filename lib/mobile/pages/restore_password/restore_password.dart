import 'package:admin_page/mobile/navigation/navigator.dart';
import 'package:admin_page/shared/utils/ui.dart';
import 'package:balanced_text/balanced_text.dart';
import 'package:flutter/material.dart';
import 'package:fefufit_uikit/fefufit_uikit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../gen/i18n/strings.g.dart';

class RestorePasswordPage extends StatelessWidget {
  const RestorePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          color: context.ffTheme.color.mainControllColor,
          onPressed: AppNavigator.openAuth,
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(ffPaddingLarge),
          child: Column(
            children: [
              Text(
                t.auth.restorePassword,
                style: context.textTheme.headlineMedium,
              ),
              const SizedBox(height: ffPaddingMedium),
              BalancedText(
                t.auth.restorePasswordHint,
                style: context.textTheme.bodyLarge,
              ),
              const SizedBox(height: ffPaddingMedium),
              const _RestoreForm(),
              const SizedBox(height: ffPaddingMedium),
              Observer(
                builder: (_) => FFMainButton(
                  text: t.auth.sendRestoreLink,
                  onTap: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RestoreForm extends StatelessWidget {
  const _RestoreForm({super.key});

  @override
  Widget build(BuildContext context) => Form(
        child: AutofillGroup(
          child: FFTextField(
            hint: t.auth.emailHint,
            controller: TextEditingController(),
            // validator: ,
            autofillHints: const [AutofillHints.email],
            textInputAction: TextInputAction.next,
            formatters: [
              FilteringTextInputFormatter.deny(' '),
            ],
          ),
        ),
      );
}
