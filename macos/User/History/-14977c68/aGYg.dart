import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:zanalys/patient/models/patient_record.dart';

import 'bloc/patient_records_bloc.dart';

class PatientRecordsView extends StatelessWidget {
  const PatientRecordsView({
    super.key,
    required this.patientId,
    this.onRecordSelected,
  });

  final String patientId;
  final void Function(PatientRecord)? onRecordSelected;

  void _onStateChanged(BuildContext context, PatientRecordsState state) {
    if (state is PatientRecordsError) {
      context.showErrorSnackBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientRecordsBloc(
        patientId: patientId,
        patientService: GetIt.I.get(),
      )..add(const PatientRecordsFetchRequested()),
      child: BlocListener<PatientRecordsBloc, PatientRecordsState>(
        listener: _onStateChanged,
        child: _PatientRecordsView(
          patientId: patientId,
          avatarCacheService: GetIt.instance.get(),
          onRecordSelected: onRecordSelected,
        ),
      ),
    );
  }
}

const _kPlaceholderNumber = 3;

class _PatientRecordsView extends StatelessWidget {
  const _PatientRecordsView({
    super.key,
    required this.avatarCacheService,
    required this.patientId,
    this.onRecordSelected,
  });

  final String patientId;
  final AvatarCacheService avatarCacheService;
  final void Function(PatientRecord)? onRecordSelected;

  @override
  Widget build(BuildContext context) {
    final state = context.select((PatientRecordsBloc bloc) => bloc.state);

    if (state is PatientRecordsReady) {
      if (state.records.isEmpty == true) return const EmptyListIndicator();
      return ListView.separated(
        itemCount: state.records.length,
        separatorBuilder: _separatorBuilder,
        itemBuilder: (BuildContext context, int index) => _recordBuilder(
          context,
          state.records[index],
        ),
      );
    }
    return ListView.separated(
      itemCount: _kPlaceholderNumber,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
      ),
      itemBuilder: _placeholderBuilder,
    );
  }

  Widget _recordBuilder(BuildContext context, PatientRecord record) {
    return RecordTile(
      RecordCardData.patientRecord(
        recordTitle: record.recordType,
        image: avatarCacheService.avatar(patientId),
        status: record.status.isDone ? Status.blue : Status.green,
        progress: record.status.progress,
      ),
      onTap: () => onRecordSelected?.call(record),
    );
  }
}

Widget _separatorBuilder(BuildContext context, int index) => const Divider(
      height: 1,
    );

Widget _placeholderBuilder(BuildContext context, int index) {
  return Shimmer(
      child: Container(
    color: Colors.white,
    height: 89,
    width: double.infinity,
  ));
}
