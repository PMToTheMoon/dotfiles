import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:zanalys/app/app_services.dart';
import 'package:zanalys/authentication/otp/view/otp_page.dart';
import 'package:zanalys/authentication/signin/bloc/signin_bloc.dart';
import 'package:zanalys/authentication/signin/bloc/signin_state.dart';
import 'package:zanalys/utils/bloc_utils.dart';

import 'signin_body.dart';

class SignInScreen extends StatefulWidget {
  static const route = 'sign_in';

  const SignInScreen({Key? key, this.args}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.args != null && widget.args!.isForcedLogout) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _showError(context.l10n.error_session_expired),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocCreatorWithListener<SignInBloc, SignInState>(
      create: (context) => SignInBloc(),
      listener: (context, state) {
        if (state.status.isSubmissionInProgress) {
          _showLoading(true);
        }
        if (state.status.isSubmissionFailure) {
          _showLoading(false);
          _showError(context.l10n.error_undefined);
        }
        if (state.status.isSubmissionSuccess) {
          _showLoading(false);
          AppServices.navigation.toOTP(
            OTPPageArgs(
              identifier: state.identifier.value,
              password: state.password.value,
            ),
          );
        }
      },
      child: Scaffold(
        body: FullScreenLoader(
          isLoading: _isLoading,
          child: const SignInBody(),
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
