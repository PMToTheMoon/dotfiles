import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:neat/neat.dart';

import 'package:models/models.dart';
import 'package:common/common.dart';
import 'package:zanalys/record/add_doctor/add_doctor_page.dart';
import 'package:zanalys/record/add_doctor/bloc/doctor_list_bloc.dart';
import 'package:zanalys/record/hub/bloc/hub_bloc.dart';
import 'package:zanalys/record/hub/doctors/bloc/record_doctors_bloc.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({
    super.key,
    required this.hub,
    required this.doctors,
    required this.cacheService,
  });

  final HubReady hub;
  final AvatarCacheService cacheService;
  final List<Doctor> doctors;

  void _onStateChanged(BuildContext context, RecordDoctorsState state) {
    if (state is RecordDoctorsError) {
      context.showErrorSnackBar();
    } else if (state is RecordDoctorsSuccess) {
      context.read<HubBloc>().add(const HubEvent.fetchRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RecordDoctorsBloc(
        recordService: GetIt.I.get(),
      ),
      child: BlocListener<RecordDoctorsBloc, RecordDoctorsState>(
        listener: _onStateChanged,
        child: _DoctorsView(
          hub: hub,
          cacheService: cacheService,
          doctors: doctors,
        ),
      ),
    );
  }
}

class _DoctorsView extends StatelessWidget {
  const _DoctorsView({
    required this.hub,
    required this.doctors,
    required this.cacheService,
  });
  final HubReady hub;
  final AvatarCacheService cacheService;
  final List<Doctor> doctors;

  void _onAddDoctorPressed(BuildContext context) async {
    void ondDoctorsSelected(Set<SelectedDoctor> doctors) {
      Navigator.of(context).pop();
      context
          .read<RecordDoctorsBloc>()
          .add(RecordDoctorsEvent.servicesRequested(
            recordId: hub.record.id,
            requests: doctors
                .map((e) => DoctorServiceRequest(
                    doctorId: e.doctor.id, service: e.request))
                .toSet(),
          ));
    }

    await AddDoctorPage.open(
      context,
      patient: hub.record.patient,
      recordType: hub.record.type,
      onDoctorsSelected: ondDoctorsSelected,
      excludeDoctors: hub.doctors.map((e) => e.id).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SpaceSmall.h(),
          Flexible(
            fit: FlexFit.loose,
            child: IdentityList(
              identities: doctors,
              identityBuilder: (Doctor doctor) => Identity(
                avatar: cacheService.avatar(doctor.id),
                firstName: doctor.firstName,
                lastName: doctor.lastName,
              ),
              footer: Padding(
                padding: const EdgeInsets.only(
                  left: Dimensions.paddingSmall,
                  right: Dimensions.paddingSmall,
                  top: Dimensions.paddingMedium,
                ),
                child: HighlightedOutlinedButton(
                  onPressed: () => _onAddDoctorPressed(context),
                  child: Center(child: Text(context.l10n.add)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
