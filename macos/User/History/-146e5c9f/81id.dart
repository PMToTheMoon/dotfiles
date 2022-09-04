import 'package:flutter/material.dart';

extension Dialogs on BuildContext {
  Future<void> showConfirmationDialog(
    String title,
    String message, {
    required VoidCallback onAccept,
  }) async {
    showDialog(
        context: this,
        builder: (ctx) => AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: [
                TextButton(onPressed: onAccept, child: Text("Ok")),
                TextButton(onPressed: Navigator.of(ctx).pop, child: child),
              ],
            ));
  }
}
