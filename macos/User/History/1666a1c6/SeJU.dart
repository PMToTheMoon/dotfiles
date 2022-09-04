import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'models/observation_card_data_part.dart';

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
      identity: identity,
      hiddenObservation: hiddenObservation,
      patientObservation: patientObservation,
      medicalHistory: medicalHistory,
      date: date,
      symptoms: symptoms,
      treatments: treatments,
      additional_observation: additional_observation,
    );
