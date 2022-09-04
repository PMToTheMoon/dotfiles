import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:tech_by_tech/auth/login/widgets/login_form/login_form_controller.dart';
import 'package:translations/translations.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final controller = LoginFormController(email: email, password: password);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TbtTextFormField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: context.l10n.email_label,
            hintText: context.l10n.email_hint,
          ),
        ),
        const SpaceSmall.h(),
        TbtTextFormField(
          decoration: InputDecoration(
            labelText: context.l10n.password_label,
            hintText: context.l10n.password_hint,
          ),
        ),
        const SpaceSmall.h(),
        Row(children: [
          Checkbox(value: true, onChanged: (_) {}),
          const SpaceSmallest.w(),
          Expanded(
            child: context.bodyMedium(
              context.l10n.login_remember_credentials_text,
            ),
          ),
        ]),
        const SpaceMedium.h(),
        Align(
          child: ElevatedButton(
            onPressed: () {},
            child: Text(context.l10n.login_button),
          ),
        ),
      ],
    );
  }
}
