import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:zanalys/app/app_services.dart';
import 'package:zanalys/components/full_screen_loader_layout.dart';
import 'package:zanalys/features/authentication/otp/otp_screen.dart';
import 'package:zanalys/features/authentication/signin/bloc/signin_bloc.dart';
import 'package:zanalys/features/authentication/signin/bloc/signin_state.dart';
import 'package:zanalys/features/authentication/signin/ui/signin_body.dart';
import 'package:zanalys/generated/locale_keys.g.dart';
import 'package:zanalys/utils/bloc_utils.dart';

class SignInScreen extends StatefulWidget {
  final SignInScreenArgs? args;

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
        (_) => _showError(LocaleKeys.global_errors_sessionExpired.tr()),
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
          _showError(LocaleKeys.global_errors_undefined.tr());
        }
        if (state.status.isSubmissionSuccess) {
          _showLoading(false);
          AppServices.navigation.toOTP(
            OTPScreenArgs(
              identifier: state.identifier.value,
              password: state.password.value,
            ),
          );
        }
      },
      child: Scaffold(
        body: FullScreenLoaderLayout(
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

class SignInScreenArgs {
  final bool isForcedLogout;

  SignInScreenArgs({required this.isForcedLogout});
}
