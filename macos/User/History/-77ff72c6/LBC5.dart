import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:neat/neat.dart';

import 'package:common/common.dart';
import 'package:app_client/login/login.dart';
import 'package:app_client/forgot_password/forgot_password.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  _LoginFormState();

  @override
  void initState() {
    final state = context.read<LoginBloc>().state;
    if (state is LoginInitialState) {
      emailController.text = state.email ?? "";
    }
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  void _loginStateListener(BuildContext context, LoginState state) {
    if (state is LoginUnauthorizedState) passwordController.clear();
  }

  void _submitForm() {
    if (formKey.currentState?.validate() ?? false) {
      final login = context.read<LoginBloc>();
      login.add(LoginEvent.formSubmitted(
        email: emailController.text,
        password: passwordController.text,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: _loginStateListener,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: context.l10n.email_hint,
                  suffixIcon: const Icon(Icons.person),
                ),
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      context,
                      errorText: context.l10n.field_required_error,
                    ),
                    FormBuilderValidators.email(
                      context,
                      errorText: context.l10n.bad_email_format_error,
                    ),
                  ],
                )),
            const Space4(),
            TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.go,
              obscureText: obscurePassword,
              validator: FormBuilderValidators.required(
                context,
                errorText: context.l10n.field_required_error,
              ),
              decoration: InputDecoration(
                hintText: context.l10n.password_hint,
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    obscurePassword = !obscurePassword;
                  }),
                  icon: Icon(
                    obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ForgotPasswordBuilder(
                builder: (context, resetPasword, _) => TextButton(
                  onPressed: () => resetPasword(emailController.text),
                  child: Text(context.l10n.forgot_password_button),
                ),
              ),
            ),
            const Space4(),
            const Align(
              alignment: Alignment.centerLeft,
              child: _ErrorMessage(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: _ValidateButton(
                onSubmit: _submitForm,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select((LoginBloc bloc) => bloc.state);
    late final Widget error;

    if (state is LoginUnauthorizedState) {
      error = Padding(
        padding: const Padding4(bottom),
        child: Text(
          context.l10n.invalid_credential_error,
          style: TextStyle(color: context.colorScheme.error),
        ),
      );
    } else {
      error = const SizedBox.shrink();
    }

    return AnimatedSwitcher(
      child: error,
      duration: Feel.animationDuration,
      switchInCurve: Feel.animationCurve,
      switchOutCurve: Feel.animationCurve,
    );
  }
}

class _ValidateButton extends StatelessWidget {
  const _ValidateButton({
    required this.onSubmit,
    Key? key,
  }) : super(key: key);

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final state = context.select((LoginBloc bloc) => bloc.state);
    late final Widget content;

    if (state is LoginLoadingState) {
      content = const SizedBox(
        height: Dimensions.space4,
        width: Dimensions.space4,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2,
        ),
      );
    } else {
      content = Text(context.l10n.login_button);
    }

    return ElevatedButton(
      onPressed: onSubmit,
      child: content,
    );
  }
}
