import 'package:flutter/material.dart';
import 'package:translations/translations.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator([String? message, Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorWidget(e ?? context.l10n.error_undefined);
  }
}
