import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:models/models.dart';
import 'package:zanalys/auth/auth.dart';
import 'package:zanalys/doctor/doctor_service.dart';
import 'package:zanalys/record/add_doctor/bloc/doctor_list_bloc.dart';

import 'bloc/create_record_bloc.dart';

class CreateRecordPage extends StatelessWidget {
  static MaterialPageRoute materialPageRoute({
    required Patient patient,
    required RecordType recordType,
    required Set<SelectedDoctor> doctors,
    required VoidCallback onRecordCreated,
    required VoidCallback onError,
  }) =>
      MaterialPageRoute(
        builder: (context) => CreateRecordPage(
          patient: patient,
          recordType: recordType,
          doctors: doctors,
          onRecordCreated: onRecordCreated,
          onError: onError,
        ),
      );

  static Future open(
    BuildContext context, {
    required Patient patient,
    required RecordType recordType,
    required Set<SelectedDoctor> doctors,
    required VoidCallback onRecordCreated,
    required VoidCallback onError,
  }) =>
      Navigator.of(context).push(
        materialPageRoute(
          patient: patient,
          recordType: recordType,
          doctors: doctors,
          onRecordCreated: onRecordCreated,
          onError: onError,
        ),
      );

  const CreateRecordPage({
    super.key,
    required this.patient,
    required this.recordType,
    required this.doctors,
    required this.onRecordCreated,
    required this.onError,
  });

  final Patient patient;
  final RecordType recordType;
  final Set<SelectedDoctor> doctors;
  final VoidCallback onRecordCreated;
  final VoidCallback onError;

  NewRecord _newRecord(BuildContext context) => NewRecord(
        patientId: patient.id,
        creatorId: context.read<AuthBloc>().userId!,
        type: recordType,
        patientConsent: true,
        trustedPersonConsent: false,
        trustedPersonFirstName: 'not specified',
        trustedPersonLastName: 'not specified',
        trustedPersonFamilyLink: 'not specified',
        serviceRequests: doctors
            .map((doctor) => DoctorServiceRequest(
                  doctorId: doctor.doctor.id,
                  service: doctor.request,
                ))
            .toList(),
      );

  void _onStateChanged(BuildContext context, CreateRecordState state) {
    if (state is CreateRecordSuccess) {
      onRecordCreated();
    } else if (state is CreateRecordError) {
      onError();
    }
  }

  @override
  Widget build(BuildContext context) {
    final AvatarCacheService avatarService = GetIt.instance.get();
    return Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => CreateRecordBloc(userService: GetIt.I.get()),
          // ..add(CreateRecordEvent.creationRequested(
          //   record: _newRecord(context),
          // )),
          child: BlocListener<CreateRecordBloc, CreateRecordState>(
            listener: _onStateChanged,
            child: Scaffold(
              appBar: titleSubtitleAvatarAppBar(
                context,
                title: context.l10n.add_doctor_page_title,
                subtitle: recordType.displayName(context),
                image: avatarService.avatar(patient.id),
              ),
              body: BlocBuilder<CreateRecordBloc, CreateRecordState>(
                builder: (context, state) => state.map(
                  initial: (_) => LoadingIndicator(),
                  create: (_) => LoadingIndicator(),
                  success: (_) => Center(child: Text("Success")),
                  error: (_) => Center(child: Text("error")),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
