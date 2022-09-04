import 'package:app_client/login/login.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:common/common.dart';
import 'package:neat/neat.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/sign_in/sign_in.dart';

class PinCodePage extends StatelessWidget {
  static Future<void> open(
    BuildContext context, {
    required SignInFormData signInFormData,
  }) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => PinCodePage(signInFormData: signInFormData),
        ),
      );

  static void goBack(
    BuildContext context,
  ) =>
      Navigator.of(context).pop();

  const PinCodePage({
    Key? key,
    required this.signInFormData,
  }) : super(key: key);

  final SignInFormData signInFormData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CodeBloc(
        formData: signInFormData,
        authRepository: context.read(),
      ),
      child: _PinCodePage(
        phoneNumber: signInFormData.phoneNumber,
      ),
    );
  }
}

class _PinCodePage extends StatelessWidget {
  _PinCodePage({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  final String phoneNumber;
  final _controller = TextEditingController();

  _onCodeStateChanged(BuildContext context, CodeState state) async {
    if (state is CodeSendError) {
      await showErrorDialog(
        context,
        message: context.l10n.unable_to_send_code_error,
      );
      Navigator.of(context).pop();
    }
    if (state is CodeInvalid) {
      _controller.clear();
      showError(context, message: context.l10n.invalid_code_error);
    }
    if (state is CodeSignInError) {
      late final String message;
      switch (state.reason) {
        case SignInFailure.EmailExist:
          message = context.l10n.sign_in_failed_email_exist_error;
          break;
        default:
          message = context.l10n.sign_in_failed_error;
          break;
      }
      await showErrorDialog(
        context,
        message: message,
      );
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
    if (state is CodeLogInError) {
      await showSuccessDialog(
        context,
        message: context.l10n.log_in_failed_error,
      );
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context).pushReplacementNamed(LoginPage.route);
    }
  }

  _submitCode(BuildContext context, String code) {
    context.read<CodeBloc>().add(
          CodeEvent.codeSubmitted(code: code),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CodeBloc, CodeState>(
      listener: _onCodeStateChanged,
      child: WillPopScope(
        onWillPop: () async => true,
        child: Page(
          appBar: titledAppBar(context,
              title: context.l10n.sign_in_code_check_title),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Space2.h(),
              Padding(
                padding: const Padding3.horizontal(),
                child: context.bodyText1(
                  context.l10n.sign_in_code_check_message(phoneNumber),
                  textAlign: TextAlign.center,
                ),
              ),
              const _CodeLoadingIndicator(),
              Padding(
                padding: const Padding1.horizontal(),
                child: FittedBox(
                  child: CodeInput(
                    controller: _controller,
                    onCompleted: (code) => _submitCode(context, code),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CodeInput extends StatelessWidget {
  const CodeInput({
    Key? key,
    required this.onCompleted,
    required this.controller,
  }) : super(key: key);

  final void Function(String) onCompleted;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final enableCodeInput = context.select(
      (CodeBloc bloc) => bloc.state,
    ) is! CodeSubmitting;

    return PinCodeTextField(
      controller: controller,
      appContext: context,
      length: 6,
      animationType: AnimationType.fade,
      textCapitalization: TextCapitalization.characters,
      enabled: enableCodeInput,
      onChanged: (_) {},
      onCompleted: onCompleted,
      autoFocus: true,
      pinTheme: PinTheme(
        activeColor: context.colorScheme.onSurface,
        selectedColor: context.colorScheme.primary,
        errorBorderColor: context.colorScheme.onSurface,
        inactiveColor: context.colorScheme.onSurface,
        disabledColor: context.colorScheme.onSurface,
        fieldWidth: 21,
      ),
    );
  }
}

class _CodeLoadingIndicator extends StatelessWidget {
  const _CodeLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select((CodeBloc bloc) => bloc.state);

    if (state is CodeSubmitting || state is CodeSending) {
      return const SizedBox(
        height: Dimensions.space1,
        child: LoadingIndicator.small(),
      );
    }
    return const Space1.h();
  }
}
