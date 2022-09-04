import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:models/models.dart';
import 'package:neat/neat.dart';
import 'package:zanalys/record/add_doctor/widgets/add_doctor_list_view.dart';

import 'bloc/doctor_list_bloc.dart';

class AddDoctorPage extends StatelessWidget {
  static Future<void> open(
    BuildContext context, {
    required Patient patient,
    required RecordType recordType,
  }) =>
      Navigator.of(context).push(materialPageRoute(
        patient: patient,
        recordType: recordType,
      ));

  static MaterialPageRoute materialPageRoute({
    required Patient patient,
    required RecordType recordType,
  }) =>
      MaterialPageRoute(
        builder: (context) => AddDoctorPage(
          patient: patient,
          recordType: recordType,
        ),
      );

  const AddDoctorPage({
    required this.patient,
    required this.recordType,
    super.key,
  });

  final Patient patient;
  final RecordType recordType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return DoctorListBloc(doctorService: GetIt.instance.get())
          ..add(const DoctorListEvent.started());
      },
      child: _AddDoctorPage(
        patient: patient,
        recordType: recordType,
      ),
    );
  }
}

class _AddDoctorPage extends StatelessWidget {
  const _AddDoctorPage({
    super.key,
    required this.patient,
    required this.recordType,
  });

  final Patient patient;
  final RecordType recordType;

  @override
  Widget build(BuildContext context) {
    final AvatarCacheService avatarService = GetIt.instance.get();
    return Scaffold(
      appBar: titleSubtitleAvatarAppBar(
        context,
        title: context.l10n.add_doctor_page_title,
        subtitle: recordType.displayName(context),
        image: avatarService.avatar(patient.id),
      ),
      backgroundColor: context.colorScheme.surface,
      body: Stack(
        children: [
          AddDoctorListView(
            avatarCacheService: avatarService,
          ),
          Positioned(
            bottom: Dimensions.paddingSmall,
            left: Dimensions.paddingSmall,
            right: Dimensions.paddingSmall,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(context.l10n.add_doctor_button),
            ),
          )
        ],
      ),
    );
  }
}
