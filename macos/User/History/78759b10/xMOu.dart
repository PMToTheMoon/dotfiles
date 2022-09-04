import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:neat/neat.dart';

import 'bloc/patient_list_bloc.dart';

class PatientListPage extends StatelessWidget {
  const PatientListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientListBloc(
        userService: GetIt.I.get(),
      )..add(const PatientListFetchRequested(filter: '')),
      child: const _PatientListPage(),
    );
  }
}

class _PatientListPage extends StatelessWidget {
  const _PatientListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select((PatientListBloc bloc) => bloc.state);

    return Scaffold(
      appBar: titleSubtitleAppBar(
        context,
        title: context.l10n.patient_list_page_title,
        subtitle: context.l10n.patient_list_page_subtitle,
      ),
      backgroundColor: context.colorScheme.surface,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: const PaddingSmall(top | left | right),
            child: TextField(
              onChanged: (value) => context
                  .read<PatientListBloc>()
                  .add(PatientListFetchRequested(filter: value)),
              decoration: InputDecoration(
                hintText: context.l10n.search,
              ),
            ),
          ),
          const SpaceSmaller.h(),
          Expanded(
            child: PatientList(
              avatarCacheService: GetIt.instance.get(),
              patients: state is PatientListReady ? state.patients : null,
              onPatientSelected: (patient) =>
                  PatientPage.open(context, patient),
            ),
          ),
        ],
      ),
    );
  }
}
