import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_client/forgot_password/forgot_password.dart';
import 'package:common/common.dart';

typedef ResetPasswordCallback = void Function(String email);

class _ForgotPasswordLink extends StatelessWidget {
  const _ForgotPasswordLink({
    Key? key,
    required this.emailController,
    required this.builder,
  }) : super(key: key);

  final TextEditingController emailController;
  final Widget Function(
      BuildContext context, ResetPasswordCallback resetPassword) builder;

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

  void _resetPassword(String email) {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordBloc(
        authRepository: context.read(),
      ),
      child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        listener: _onForgotPasswordStateChanged,
        builder: (context, state) => builder(
          context,
          (String email) => context
              .read<ForgotPasswordBloc>()
              .add(ForgotPasswordResetRequested(
                email: email,
              )),
        ),
      ),
    );
  }
}

// (context, state) {
//           return TextButton(
//             onPressed: () => 
//             child: Text(context.l10n.forgot_password_button),
//           );
//         },
//       ),