import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:neat/neat.dart';
import 'package:zanalys/user/models/patient.dart';

class PatientPage extends StatelessWidget {
  static Future<void> open(BuildContext context, Patient patient) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => PatientPage(
            patient: patient,
          ),
        ),
      );

  PatientPage({
    super.key,
    required this.patient,
  }) : avatarCacheService = GetIt.instance.get();

  final Patient patient;
  final AvatarCacheService avatarCacheService;

  @override
  Widget build(BuildContext context) {
    return _PatientPage(
        patient: patient, avatarCacheService: avatarCacheService);
  }
}

class _PatientPage extends StatelessWidget {
  const _PatientPage({
    Key? key,
    required this.patient,
    required this.avatarCacheService,
  }) : super(key: key);

  final Patient patient;
  final AvatarCacheService avatarCacheService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleSubtitleAvatarAppBar(
        context,
        subtitle: 'patient',
        title: '${patient.firstName} ${patient.lastName}',
        image: avatarCacheService.avatar(patient.id),
      ),
      backgroundColor: context.colorScheme.surface,
      body: DefaultTabController(
        length: 2,
        child: Column(children: [
          const UnderlineTabBar(
            tabs: [
              "Parcous",
              "Informations",
            ],
          )
        ]),
      ),
    );
  }
}
