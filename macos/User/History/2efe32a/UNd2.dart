import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:zanalys/app/app_services.dart';

import 'package:zanalys/utils/bloc_utils.dart';
import 'package:zanalys/authentication/otp/otp.dart';

import 'otp_body.dart';

class OTPScreen extends StatefulWidget {
  final OTPScreenArgs args;

  const OTPScreen({Key? key, required this.args}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocCreatorWithListener<OTPBloc, OTPState>(
      create: (context) => OTPBloc(
          identifier: widget.args.identifier, password: widget.args.password),
      listener: (context, state) {
        if (state.status.isSubmissionInProgress) {
          _showLoading(true);
        }
        if (state.status.isSubmissionFailure) {
          _showLoading(false);
          _showError();
        }
        if (state.status.isSubmissionSuccess) {
          _showLoading(false);
          AppServices.navigation.toHome();
        }
      },
      child: Scaffold(
        body: FullScreenLoader(
          isLoading: _isLoading,
          child: const OTPBody(),
        ),
      ),
    );
  }

  _showLoading(bool show) {
    setState(() {
      _isLoading = show;
    });
  }

  _showError() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(context.l10n.error_undefined),
        ),
      );
  }
}

class OTPScreenArgs {
  final String identifier;
  final String password;

  OTPScreenArgs({required this.identifier, required this.password});
}
