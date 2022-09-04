import 'package:flutter/material.dart';
import 'package:translations/translations.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator([this.message, Key? key]) : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return ErrorWidget(message ?? context.l10n.error_undefined);
  }
}
