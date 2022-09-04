import 'package:flutter/material.dart';

class PatientPage extends StatelessWidget {
  static Future<void> open(BuildContext context, String patientId) =>
      Navigator.of(context);

  const PatientPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('PatientPage');
  }
}
