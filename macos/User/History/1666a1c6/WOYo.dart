import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'models/observation_card_data_part.dart';

part 'widgets/hidden_observation.dart';
part 'widgets/patient_observation.dart';
part 'widgets/symptoms.dart';
part 'widgets/treatment.dart';
part 'widgets/medical_history.dart';
part 'widgets/additional_observations.dart';

class ObservationCard extends StatelessWidget {
  const ObservationCard({
    required this.dataParts,
    super.key,
  });

  final List<ObservationCardDataPart> dataParts;

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      padding: PaddingSmall.all(),
      child: const Text('ObservationCard'),
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
