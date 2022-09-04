import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:zanalys/authentication/otp/otp.dart';

import 'otp_body.dart';

class OTPPage extends StatefulWidget {
  static const route = 'otp';

  static Future<void> open(BuildContext context, OTPPageArgs args) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OTPPage(
            args: args,
          ),
        ),
      );

  final OTPPageArgs args;

  const OTPPage({Key? key, required this.args}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  bool _isLoading = false;

  void _onStateChanged(BuildContext c, OTPState s) {
    if (s.status.isSubmissionInProgress) {
      _showLoading(true);
    }
    if (s.status.isSubmissionFailure) {
      _showLoading(false);
      _showError();
    }
    if (s.status.isSubmissionSuccess) {
      _showLoading(false);
      Navigator.of(c).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => OTPBloc(
        identifier: widget.args.identifier,
        password: widget.args.password,
      ),
      child: BlocConsumer<OTPBloc, OTPState>(
        listener: _onStateChanged,
        builder: (c, s) => Scaffold(
          body: FullScreenLoader(
            isLoading: _isLoading,
            child: const OTPBody(),
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

class OTPPageArgs {
  final String identifier;
  final String password;

  OTPPageArgs({required this.identifier, required this.password});
}
