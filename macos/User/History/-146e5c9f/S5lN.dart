import 'package:flutter/material.dart';

extension Dialogs on BuildContext {
  Future<void> showConfirmationDialog(
    String title,
    String message, {
    required VoidCallback onAccept,
  }) async {
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(onPressed: onAccept, child: Text("Ok")),
        continueButton,
      ],
    );
    showDialog(context: this, builder: (ctx) => AlertDialog());
  }
}
