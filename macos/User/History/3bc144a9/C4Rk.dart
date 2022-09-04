import 'dart:io';

import 'package:flutter/material.dart';
import 'package:common/common.dart';
import 'package:neat/neat.dart';

Future<void> showSuccessDialog(BuildContext context,
        {required String message}) =>
    showDialog(
      context: context,
      builder: (context) => SuccessDialog(
        title: message,
      ),
    );

Future<void> showErrorDialog(BuildContext context, {required String message}) =>
    showDialog(
      context: context,
      builder: (context) => ErrorDialog(
        title: message,
      ),
    );

void showError(
  BuildContext context, {
  required String message,
  Key? key,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: context.colorScheme.primary,
      content: Text(
        message,
        style: TextStyle(
          color: context.colorScheme.onError,
        ),
      ),
      action: SnackBarAction(
        label: context.l10n.ok,
        onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        textColor: context.colorScheme.onError,
      ),
    ),
  );
}

void showFatalError(
  BuildContext context, {
  required String message,
  Key? key,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 5),
      backgroundColor: context.colorScheme.primary,
      content: Text(
        message,
        style: TextStyle(
          color: context.colorScheme.onError,
        ),
      ),
      action: SnackBarAction(
        label: context.l10n.exit,
        onPressed: () => exit(1),
        textColor: context.colorScheme.onError,
      ),
    ),
  );
}
