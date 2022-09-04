import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:models/models.dart';
import 'package:neat/neat.dart';
import 'package:zanalys/patient/patient_view/patient_details/patient_details_view.dart';

import 'patient_records/patient_records_view.dart';

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
        subtitle: context.l10n.patient_view_page_subtitle,
        title: '${patient.firstName} ${patient.lastName}',
        image: avatarCacheService.avatar(patient.id),
      ),
      backgroundColor: context.colorScheme.surface,
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UnderlineTabBar(
              tabs: [
                context.l10n.patient_view_record_list_tab,
                context.l10n.patient_view_infos_tab,
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                PatientRecordsView(
                  patientId: patient.id,
                  onRecordSelected: (_) {},
                ),
                PatientDetailsView(
                  patientId: patient.id,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
