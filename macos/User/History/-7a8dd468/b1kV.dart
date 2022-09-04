import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:zanalys/patient/models/patient_record.dart';
import 'package:zanalys/patient/patient_service.dart';

import 'bloc/patient_details_bloc.dart';

class PatientDetailsView extends StatefulWidget {
  const PatientDetailsView({
    super.key,
    required this.patientId,
    this.onRecordSelected,
  });

  final String patientId;
  final void Function(PatientRecord)? onRecordSelected;

  @override
  State<PatientDetailsView> createState() => _PatientDetailsViewState();
}

class _PatientDetailsViewState extends State<PatientDetailsView>
    with AutomaticKeepAliveClientMixin {
  void _onStateChanged(BuildContext context, PatientDetailsState state) {
    if (state is PatientDetailsError) {
      context.showErrorSnackBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => PatientDetailsBloc(
        patientId: widget.patientId,
        patientService: GetIt.I.get(),
      )..add(const PatientDetailsFetchRequested()),
      child: BlocListener<PatientDetailsBloc, PatientDetailsState>(
        listener: _onStateChanged,
        child: const _PatientDetailsView(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _PatientDetailsView extends StatelessWidget {
  const _PatientDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.select((PatientDetailsBloc bloc) => bloc.state);
    if (state is! PatientDetailsReady) return const LoadingIndicator();
    return Padding(
      padding: const PaddingSmall(),
      child: Column(
        children: [
          TextFormField(
            initialValue: "test",
            enabled: false,
            decoration: InputDecoration(
              label: Text("labale"),
            ),
          )
        ],
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    super.key,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: "test",
      enabled: false,
      decoration: const InputDecoration(
        label: Text("labale"),
      ),
    );
  }
}
