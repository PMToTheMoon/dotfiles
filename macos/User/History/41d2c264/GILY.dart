import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:zanalys/app/app_services.dart';
import 'package:zanalys/authentication/otp/view/otp_page.dart';
import 'package:zanalys/authentication/signin/bloc/signin_bloc.dart';
import 'package:zanalys/authentication/signin/bloc/signin_state.dart';
import 'package:zanalys/home/view/home_page.dart';
import 'package:zanalys/utils/bloc_utils.dart';

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
    //   WidgetsBinding.instance.addPostFrameCallback(
    //     (_) => _showError(context.l10n.error_session_expired),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BlocCreatorWithListener<SignInBloc, SignInState>(
      create: (context) => SignInBloc(),
      listener: (context, state) async {
        if (state.status.isSubmissionInProgress) {
          _showLoading(true);
        }
        if (state.status.isSubmissionFailure) {
          _showLoading(false);
          _showError(context.l10n.error_undefined);
        }
        if (state.status.isSubmissionSuccess) {
          _showLoading(false);
          await OTPPage.open(
            context,
            OTPPageArgs(
              identifier: state.identifier.value,
              password: state.password.value,
            ),
          );
          await Navigator.of(context).pushNamedAndRemoveUntil(
            HomePage.route,
            (route) => false,
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
