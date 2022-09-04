import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:models/models.dart';
import 'package:neat/neat.dart';
import 'package:zanalys/patient/patient_view/patient_view_page.dart';

import 'bloc/patient_list_bloc.dart';
import 'widgets/patient_list.dart';

class PatientListPage extends StatelessWidget {
  static PatientListPage builder(BuildContext context, {

  }) =>
      const PatientListPage();

  static MaterialPageRoute materialPageRoute() =>
      MaterialPageRoute(builder: builder);

  const PatientListPage({
    required this.onPatientSelected,
    super.key,
  });

  void _onStateChanged(BuildContext context, PatientListState state) {
    if (state is PatientListError) {
      context.showErrorSnackBar();
    }
  }

  final void Function(Patient) onPatientSelected;
  void onPatientSelected(Patient) ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientListBloc(
        userService: GetIt.I.get(),
      )..add(const PatientListFetchRequested(filter: '')),
      child: BlocListener<PatientListBloc, PatientListState>(
        listener: _onStateChanged,
        child: const _PatientListPage(),
      ),
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
              onSubmitted: (value) => context
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
