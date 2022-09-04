import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'models/observation_card_data.dart';
import 'models/observation_card_data_part.dart';

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
      padding: const PaddingSmaller.all(),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Identity(
                  avatar: data.doctor.avatar,
                  firstName: data.doctor.firstName,
                  lastName: data.doctor.lastName,
                  subtitle: data.doctor.subtitle,
                ),
              ),
              const ColoredChip.red('Cardiologue'),
            ],
          ),
          ...data.parts.map(_buildPart),
        ],
      ),
    );
  }
}

Widget _buildPart(ObservationCardDataPart part) => part.map(
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
