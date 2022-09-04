import 'package:flutter/material.dart';

class ObservationFormSnapshot {
  const ObservationFormSnapshot({
    this.textFieldValue,
  });

  final String? textFieldValue;
}

class ObservationFormController {
  ObservationFormController([ObservationFormSnapshot? initialValue]);

  final _formKey = GlobalKey<FormFieldState>();

  final TextEditingController _textFieldController;

  ObservationFormSnapshot snapshot() => const ObservationFormSnapshot();
}
