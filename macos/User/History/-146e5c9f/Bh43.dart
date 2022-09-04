import 'package:flutter/material.dart';

extension Dialogs on BuildContext {
  Future<bool> showConfirmationDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text(
          "Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
  }
}
