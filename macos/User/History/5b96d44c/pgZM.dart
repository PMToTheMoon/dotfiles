import 'package:flutter/material.dart';

class ObservationFormSnapshot {
  const ObservationFormSnapshot({
    this.textFieldValue,
  });

  final String? textFieldValue;
}

class ObservationFormController {
  ObservationFormController([ObservationFormSnapshot? initialValue]);

  final formKey = GlobalKey<FormFieldState>();

  ObservationFormSnapshot snapshot() => const ObservationFormSnapshot();
}
