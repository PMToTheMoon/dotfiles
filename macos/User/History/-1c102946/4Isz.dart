import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neat/neat.dart';
import 'package:tech_by_tech/auth/login/bloc/login_bloc.dart';
import 'package:tech_by_tech/auth/login/widgets/login_form/login_form_controller.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:translations/translations.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final LoginFormController _formController;
  late final CheckboxFieldController _checkboxFieldController;

  @override
  void initState() {
    super.initState();
    final initialState = context
        .read<LoginBloc>()
        .state
        .mapOrNull<LoginInitial>(initial: (state) => state);
    if (initialState == null) throw 'LoginBloc not found';
    _formController = LoginFormController(
      email: initialState.savedEmail,
    );
    _checkboxFieldController = CheckboxFieldController(
      initialState.saveCredentials,
    );
  }

  void _onLoginPressed() {
    if (_formController.validate()) {
      final snapshot = _formController.snapshot();
      context.read<LoginBloc>().add(
            LoginFormSubmitted(
              email: snapshot.email,
              password: snapshot.password,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TbtTextFormField(
            controller: _formController.email,
            textInputAction: TextInputAction.next,
            validator: Validators.email(context),
            decoration: InputDecoration(
              labelText: context.l10n.email_label,
              hintText: context.l10n.email_hint,
            ),
          ),
          const SpaceSmall.h(),
          TbtTextFormField(
            controller: _formController.password,
            validator: FormBuilderValidators.required(
              errorText: context.l10n.form_error_empty_field,
            ),
            decoration: InputDecoration(
              labelText: context.l10n.password_label,
              hintText: context.l10n.password_hint,
            ),
          ),
          const SpaceSmall.h(),
          CheckboxField(
            controller: _checkboxFieldController,
            onChanged: (value) => context
                .read<LoginBloc>()
                .add(LoginEvent.saveCredentialsChanged(saveCredentials: value)),
            text: context.bodyMedium(
              context.l10n.login_remember_credentials_text,
            ),
          ),
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
