import 'package:flutter/material.dart';

class ObservationFormSnapshot {
  const ObservationFormSnapshot({
    this.textField,
  });

  final String? textField;
}

class ObservationFormController {
  ObservationFormController([
    ObservationFormSnapshot? initialValue,
  ]) : textFieldController =
            TextEditingController(text: initialValue?.textField);

  final _formKey = GlobalKey<FormFieldState>();

  // controlled
  final TextEditingController textFieldController;

  // uncontrolled ?

  ObservationFormSnapshot snapshot() => const ObservationFormSnapshot();
  bool validate() => true;
}
