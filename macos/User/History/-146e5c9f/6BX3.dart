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
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: [
            TextButton(
              onPressed: Navigator.of(ctx).pop,
              child: Text("Annuler"),
            ),
            ElevatedButton(
              onPressed: () {
                onAccept();
                Navigator.of(ctx).pop();
              },
              child: Text("Ok"),
            ),
          ],
        ),
      );
}
