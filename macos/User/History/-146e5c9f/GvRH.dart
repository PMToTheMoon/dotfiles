import 'package:flutter/material.dart';

extension Dialogs on BuildContext {
  Future<void> showConfirmationDialog() {
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
