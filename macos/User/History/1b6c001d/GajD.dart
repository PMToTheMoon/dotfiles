import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_client/forgot_password/forgot_password.dart';
import 'package:common/common.dart';

/// Send an re-initialization email to the provided address
typedef ResetPasswordCallback = void Function(String email);

class ForgotPasswordLink extends StatelessWidget {
  const ForgotPasswordLink({
    Key? key,
    required this.emailController,
    required this.builder,
  }) : super(key: key);

  final TextEditingController emailController;
  final Widget Function(
    BuildContext context,
    ResetPasswordCallback resetPassword,
    ForgotPasswordState state,
  ) builder;

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
        builder: (context, state) => builder(
          context,
          (String email) => context
              .read<ForgotPasswordBloc>()
              .add(ForgotPasswordResetRequested(
                email: email,
              )),
          state,
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