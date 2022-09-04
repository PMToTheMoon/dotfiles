import 'package:flutter/material.dart';

extension Dialogs on BuildContext {
  Future<void> showConfirmationDialog(
    String title,
    String message, {
    required VoidCallback onAccept,
  }) =>
      showDialog(
        context: this,
        builder: (ctx) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            OutlinedButton(
              onPressed: onAccept,
              child: Text("Ok"),
            ),
            TextButton(
              onPressed: Navigator.of(ctx).pop,
              child: Text("Annuler"),
            ),
          ],
        ),
      );
}
