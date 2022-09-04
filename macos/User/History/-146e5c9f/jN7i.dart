import 'package:flutter/material.dart';
import 'package:common/src/l10n/l10n.dart';

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

  void showErrorSnackBar([String? message]) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message ?? l10n.error_undefined)),
    );
  }
}
