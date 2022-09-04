import 'dart:async';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:zanalys/app/services.dart';
import 'package:zanalys/auth/otp/view/otp_page.dart';
import 'package:zanalys/auth/signin/bloc/signin_bloc.dart';
import 'package:zanalys/auth/signin/bloc/signin_state.dart';
import 'package:zanalys/home/view/home_page.dart';

import 'signin_body.dart';

class SignInPage extends StatefulWidget {
  static const route = 'sign_in';

  static SignInPage builder(BuildContext context) => const SignInPage();

  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // TODO: message
    // if (widget.args != null && widget.args!.isForcedLogout) {
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) => _showError(context.l10n.error_session_expired),
    // );
    // }
  }

  Future _onStateChanged(BuildContext ctx, SignInState state) async {
    if (state.status.isSubmissionInProgress) {
      _showLoading(true);
    } else if (state.status.isSubmissionFailure) {
      _showLoading(false);
      _showError(context.l10n.error_undefined);
    } else if (state.status.isSubmissionSuccess) {
      _showLoading(false);
      await OTPPage.open(
        context,
        OTPPageArgs(
          identifier: state.identifier.value,
          password: state.password.value,
        ),
      );
      if (!mounted) return;
      unawaited(Navigator.of(context).pushNamedAndRemoveUntil(
        HomePage.route,
        (route) => false,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc()..fetchUserIdStatus(),
      child: BlocConsumer<SignInBloc, SignInState>(
        listener: _onStateChanged,
        builder: (c, s) => Scaffold(
          body: FullScreenLoader(
            isLoading: _isLoading,
            child: const SignInBody(),
          ),
        ),
      ),
    );
  }

  _showLoading(bool show) {
    setState(() {
      _isLoading = show;
    });
  }

  _showError(String error) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(error),
        ),
      );
  }
}
