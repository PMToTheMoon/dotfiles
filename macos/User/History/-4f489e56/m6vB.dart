import 'package:flutter/material.dart';

import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:models/models.dart';
import 'package:zanalys/record/hub/hub.dart';
import 'package:zanalys/record/initial_observation/bloc/initial_observation_bloc.dart';
import 'widgets/general_initial_observation_form.dart';

class GeneralInitialObservationPage extends StatelessWidget {
  static MaterialPageRoute materialPageRoute(
    BuildContext context, {
    required Record record,
  }) =>
      MaterialPageRoute(
        builder: (ctx) => GeneralInitialObservationPage(
          record: record,
        ),
      );

  const GeneralInitialObservationPage({
    required this.record,
    super.key,
  });

  void _onStateChanged(BuildContext context, InitialObservationState state) {
    if (state is InitialObservationSuccess) {
      Navigator.of(context).pushAndRemoveUntil(
        HubPage.materialPageRoute(
          recordId: record.id,
          patient: record.patient,
        ),
        (r) => r.isFirst,
      );
    }
    //  if (state is InitialObservationError) {
    //   Navigator.of(context).popUntil(
    //     (r) => r.isFirst,
    //   );
    //   context.showErrorSnackBar();
    // }
  }

  final Record record;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InitialObservationBloc(
        recordService: GetIt.I.get(),
      ),
      child: BlocListener<InitialObservationBloc, InitialObservationState>(
        listener: _onStateChanged,
        child: _GeneralInitialObservationPage(
          record: record,
        ),
      ),
    );
  }
}

class _GeneralInitialObservationPage extends StatefulWidget {
  const _GeneralInitialObservationPage({
    required this.record,
  });

  final Record record;

  @override
  State<_GeneralInitialObservationPage> createState() =>
      _GeneralInitialObservationPageState();
}

class _GeneralInitialObservationPageState
    extends State<_GeneralInitialObservationPage> {
  final _formController = GeneralInitialObservationFormController();

  void _onValidate() {
    if (_formController.validate()) {
      final snapshot = _formController.snapshot();
      final medicalInformation =
          _medicalInformationGeneralFromSnapshot(snapshot);
      final medicalContext = _medicalContextFromSnapshot(snapshot);
      context.read<InitialObservationBloc>().add(
            InitialObservationEvent.submitted(
              record: widget.record,
              title: snapshot.title,
              medicalInformationGeneral: medicalInformation,
              medicalContext: medicalContext,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((InitialObservationBloc bloc) => bloc.state);

    return OverlayLoadingIndicator(
      loading: state is InitialObservationPost,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: titleSubtitleAvatarAppBar(
          context,
          title: context.l10n.initial_observation_page_title,
          subtitle: context.l10n.record_type_general,
          image: AssetImage(Assets.images.launcherIcon.keyName),
        ),
        body: Padding(
          padding: const PaddingSmall.horizontal(),
          child: SingleChildScrollView(
            child: FormAutoScroll(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SpaceSmall.h(),
                  GeneralInitialObservationForm(
                    controller: _formController,
                    spacing: const SpaceSmall.h(),
                  ),
                  const SpaceSmall.h(),
                  ElevatedButton(
                    onPressed: _onValidate,
                    child: Text(context.l10n.validate_initial_observation),
                  ),
                  const SpaceSmall.h(),
                  const KeyboardSpace(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

MedicalInformationGeneral _medicalInformationGeneralFromSnapshot(
  GeneralInitialObservationFormSnapshot snapshot,
) {
  return MedicalInformationGeneral(
    id: 0,
    weight: snapshot.weight.toDouble(),
    height: snapshot.height.toDouble(),
    temperature: snapshot.temperature,
    heartRate: snapshot.heartRate?.toDouble(),
    SasSuspected: null,
    smoker: null,
    alcohol: null,
    smokeFrequency: null,
    alcoholFrequency: null,
    bodyMassIndex: null,
    medicalContext: null,
    comment: snapshot.additionalObservation,
    arterialPressurePas: snapshot.pas,
    arterialPressurePad: snapshot.pad,
    treatments: snapshot.treatment.toList(),
  );
}

MedicalContext _medicalContextFromSnapshot(
  GeneralInitialObservationFormSnapshot snapshot,
) {
  return MedicalContext(
    id: 0,
    epworth: null,
    medicalHistory: null, //snapshot.medicalHistory.toList(),
    definedMedicalHistory: null, //snapshot.medicalHistory.isNotEmpty,
    medicalHistoryText: snapshot.medicalHistory.toList(),
    cvRisks: false,
    cvRisksSet: null,
    symptoms: snapshot.symptoms.toList(),
    definedSymptomes: snapshot.symptoms.isNotEmpty,
    symptomsText: snapshot.symptoms.toList(),
    pain: null,
    definedPain: false,
  );
}
