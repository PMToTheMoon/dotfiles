import 'package:flutter/material.dart';
import 'package:app_client/forgot_password/forgot_password.dart';
import 'package:common/common.dart';

class _ForgotPasswordLink extends StatelessWidget {
  const _ForgotPasswordLink({
    Key? key,
    required this.emailController,
    required this.builder,
  }) : super(key: key);

  final TextEditingController emailController;
  final Widget Function(BuildContext context, VoidCallback resetPassword) builder;

  _onForgotPasswordStateChanged(BuildContext context, state) async {
    if (state is ForgotPasswordSuccess) {
      await showSuccessDialog(
        context,
        message: context.l10n.successfully_sent_reset_link(state.sentTo),
      );
    } else if (state is ForgotPasswordError) {
      showError(
        context,
        message: context.l10n.failed_to_send_reset_link,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordBloc(
        authRepository: context.read(),
      ),
      child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        listener: _onForgotPasswordStateChanged,
        builder: 
    );
  }
}

(context, state) {
          return TextButton(
            onPressed: () => context
                .read<ForgotPasswordBloc>()
                .add(ForgotPasswordResetRequested(
                  email: emailController.text,
                )),
            child: Text(context.l10n.forgot_password_button),
          );
        },
      ),