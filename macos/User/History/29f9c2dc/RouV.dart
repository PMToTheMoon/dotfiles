import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zanalys/record/hub/doctors/doctors_view.dart';
import 'package:zanalys/record/initial_observation/general/general_initial_observation_page.dart';

import 'bloc/hub_bloc.dart';
import 'observations/observations_view.dart';

class HubPage extends StatelessWidget {
  static Future<void> open(
    BuildContext context, {
    required String recordId,
    required Patient patient,
  }) =>
      Navigator.of(context).push(materialPageRoute(
        recordId: recordId,
        patient: patient,
      ));

  static MaterialPageRoute materialPageRoute({
    required String recordId,
    required Patient patient,
  }) =>
      MaterialPageRoute(
        builder: (ctx) => HubPage(
          recordId: recordId,
          patient: patient,
          avatarCache: GetIt.I.get(),
        ),
      );

  const HubPage({
    required this.recordId,
    required this.patient,
    required this.avatarCache,
    super.key,
  });

  final String recordId;
  final Patient patient;
  final AvatarCacheService avatarCache;

  void _onStateChanged(BuildContext context, HubState state) {
    if (state is HubError) {
      Navigator.of(context).pop();
      context.showErrorSnackBar();
    }
    if (state is HubReady) {
      if (state.showInitialObservationForm) {
        Navigator.of(context).pushReplacement(
          GeneralInitialObservationPage.materialPageRoute(
            context,
            record: state.data,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => HubBloc(
        userService: GetIt.I.get(),
        recordService: GetIt.I.get(),
        recordId: recordId,
      )..add(const HubFetchRequested()),
      child: BlocListener<HubBloc, HubState>(
        listener: _onStateChanged,
        child: _Hub(
          patient: patient,
          avatarCache: avatarCache,
        ),
      ),
    );
  }
}

class _Hub extends StatelessWidget {
  const _Hub({
    required this.avatarCache,
    this.patient,
  });

  final AvatarCacheService avatarCache;
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    final state = context.select((HubBloc bloc) => bloc.state);

    late final AppBar appBar;
    late final Widget body;

    if (state is! HubReady) {
      appBar = _buildAppBar(context, initialPatient: patient, record: null);
      body = const LoadingIndicator();
    } else if (state.showInitialObservationForm) {
      appBar = _buildAppBar(
        context,
        initialPatient: patient,
        record: state.data,
      );
      body = const LoadingIndicator();
    } else {
      appBar = _buildAppBar(
        context,
        initialPatient: patient,
        record: state.data,
      );
      body = DefaultTabController(
        length: 4,
        child: Column(
          children: [
            const UnderlineTabBar(tabs: [
              'Observation',
              'Document',
              'Détails',
              'Discussion',
            ]),
            Expanded(
              child: TabBarView(
                children: [
                  ObservationsView(
                    hubState: state,
                  ),
                  const EmptyListIndicator(),
                  DoctorsView(
                    cacheService: avatarCache,
                    doctors: const [
                      Doctor(
                        id: 'UP192920651280',
                        firstName: 'Nathalie',
                        lastName: 'Jake',
                        job: DoctorJob(
                          displayFr: 'test',
                          id: 6,
                        ),
                        specialty: DoctorSpecialty(
                          displayFr: 'spe',
                          id: 1,
                        ),
                      ),
                      Doctor(
                        id: 'UP192920651280',
                        firstName: 'Nathalie',
                        lastName: 'Jake',
                        job: DoctorJob(
                          displayFr: 'test',
                          id: 6,
                        ),
                        specialty: DoctorSpecialty(
                          displayFr: 'spe',
                          id: 1,
                        ),
                      ),
                      Doctor(
                        id: 'UP192920651280',
                        firstName: 'Nathalie',
                        lastName: 'Jake',
                        job: DoctorJob(
                          displayFr: 'test',
                          id: 6,
                        ),
                        specialty: DoctorSpecialty(
                          displayFr: 'spe',
                          id: 1,
                        ),
                      ),
                    ],
                  ),
                  const EmptyListIndicator(),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: body,
    );
  }

  AppBar _buildAppBar(
    BuildContext context, {
    Patient? initialPatient,
    Record? record,
  }) {
    final patient = record?.patient ?? initialPatient;
    if (patient == null) {
      return titleSubtitleAvatarAppBar(
        context,
        title: '---',
        subtitle: context.l10n.record_type_general,
        image: AssetImage(Assets.images.launcherIcon.path),
      );
    }
    return titleSubtitleAvatarAppBar(
      context,
      title: patient.displayFullName,
      subtitle: context.l10n.record_type_general,
      image: avatarCache.avatar(patient.id),
    );
  }
}
