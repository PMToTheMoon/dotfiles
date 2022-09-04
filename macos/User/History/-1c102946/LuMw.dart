import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neat/neat.dart';
import 'package:tech_by_tech/auth/login/bloc/login_bloc.dart';
import 'package:tech_by_tech/auth/login/widgets/login_form/login_form_controller.dart';
import 'package:tech_by_tech/auth/login/widgets/login_form/login_form_snapshot.dart';
import 'package:translations/translations.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final _controller = LoginFormController(
    email: context
        .read<LoginBloc>()
        .state
        .whenOrNull<String?>(initial: (email) => email),
  );

  void _onLoginPressed() {
    if (_controller.validate()) {
      final snapshot = _controller.snapshot();
      context.read<LoginBloc>().add(
            LoginFormSubmitted(
              email: snapshot.email,
              password: snapshot.password,
              // TODO: save credentials
              saveCredentials: false,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controller.formKey,
      child: Column(
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
              onPressed: _onLoginPressed,
              child: Text(context.l10n.login_button),
            ),
          ),
        ],
      ),
    );
  }
}
