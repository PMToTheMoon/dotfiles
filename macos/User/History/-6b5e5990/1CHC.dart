import 'package:common/common.dart';
import 'package:flutter/material.dart';

class PatientPage extends StatelessWidget {
  static Future<void> open(BuildContext context, String patientId) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const PatientPage(),
        ),
      );

  const PatientPage({
    super.key,
  });

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleSubtitleAvatarAppBar(
        context,
        subtitle: 'patient',
        title: 'patient',
      ),
    );
  }
}
