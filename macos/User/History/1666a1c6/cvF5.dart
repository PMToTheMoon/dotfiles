import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'models/observation_card_data.dart';

part 'widgets/hidden_observation.dart';
part 'widgets/patient_observation.dart';
part 'widgets/symptoms.dart';
part 'widgets/treatment.dart';
part 'widgets/medical_history.dart';
part 'widgets/additional_observations.dart';

class ObservationCard extends StatelessWidget {
  const ObservationCard(
    this.data, {
    super.key,
  });

  final ObservationCardData data;

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      padding: const PaddingSmall.all(),
      child: Column(
        children: [
          ...data.parts.map(_buildPart),
        ],
      ),
    );
  }
}

Widget buildPart(ObservationCardDataPart part) => part.map(
      hiddenObservation: (hiddenObservation) =>
          _HiddenObservation(hiddenObservation),
      patientObservation: (patientObservation) =>
          _PatientObservation(patientObservation),
      medicalHistory: (medicalHistory) => _MedicalHistory(medicalHistory),
      symptoms: (symptoms) => _Symptoms(symptoms),
      treatments: (treatments) => _Treatments(treatments),
      additionalObservation: (additionalObservation) =>
          _AdditionalObservation(additionalObservation),
    );
