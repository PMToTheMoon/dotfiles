import 'package:flutter/material.dart';

extension Dialogs on BuildContext {
  Future<void> showConfirmationDialog(
    String title,
    String message,
  ) async {
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(context: this, builder: (ctx) => AlertDialog());
  }
}
