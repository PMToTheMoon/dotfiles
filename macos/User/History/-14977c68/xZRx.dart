import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:neat/neat.dart';
import 'package:zanalys/patient/models/patient_record.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

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
    this.onRecordSelected,
  });

  final AvatarCacheService avatarCacheService;
  final void Function(PatientRecord)? onRecordSelected;

  @override
  Widget build(BuildContext context) {
    final state = context.select((PatientRecordsBloc bloc) => bloc.state);

    if (state is PatientRecordsReady) {
      if (state.records.isEmpty == true) return const EmptyListIndicator();
      return ListView.separated(
        itemCount: state.records.length,
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          indent: Dimensions.sizeLarge,
        ),
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
        indent: Dimensions.sizeLarge,
      ),
      itemBuilder: _placeholderBuilder,
    );
  }

  Widget _recordBuilder(BuildContext context, PatientRecord record) {
    return Material(
      color: context.colorScheme.surface,
      child: InkWell(
        onTap: () => onRecordSelected?.call(record),
        child: Padding(
          padding: const PaddingSmall(left | top | bottom),
          child: Identity(
            avatar: avatarCacheService.avatar(record.id),
            firstName: record.patientFirstName,
            lastName: record.patientLastName,
          ),
        ),
      ),
    );
  }
}

Widget _placeholderBuilder(BuildContext context, int index) {
  return Shimmer(
      child: Container(
    color: Colors.white,
    height: 89,
    width: double.infinity,
  ));
}
