import 'package:flutter/material.dart';

class ObservationFormSnapshot {
  const ObservationFormSnapshot({
    this.textFieldValue,
  });

  final String? textField;
}

class ObservationFormController {
  ObservationFormController([
    ObservationFormSnapshot? initialValue,
  ]) : textFieldController =
            TextEditingController(text: initialValue?.textField);

  final formKey = GlobalKey<FormFieldState>();

  final TextEditingController textFieldController;

  ObservationFormSnapshot snapshot() => const ObservationFormSnapshot();
}
