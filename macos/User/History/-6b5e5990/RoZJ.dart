import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:zanalys/user/models/patient.dart';

class PatientPage extends StatelessWidget {
  static Future<void> open(BuildContext context, String patientId) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const PatientPage(),
        ),
      );

  const PatientPage({
    super.key,
    required this.patient,
  });

  final Patient patient;
  final AvatarCacheService cacheService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleSubtitleAvatarAppBar(context,
          subtitle: 'patient',
          title: '${patient.firstName} ${patient.lastName}',
          image: AvatarCacheService.ava),
    );
  }
}
