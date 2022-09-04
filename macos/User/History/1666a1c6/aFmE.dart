import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

import 'models/observation_card_data.dart';
import 'models/observation_card_data_part.dart';
import 'package:intersperse/intersperse.dart';

part 'widgets/hidden_observation.dart';
part 'widgets/patient_observation.dart';
part 'widgets/symptoms.dart';
part 'widgets/treatment.dart';
part 'widgets/medical_history.dart';
part 'widgets/additional_observations.dart';
part 'widgets/rapport.dart';

class ObservationCard extends StatelessWidget {
  const ObservationCard(
    this.data, {
    super.key,
    this.space = const SpaceMedium.h(),
  });

  final ObservationCardData data;
  final Widget space;

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
              const SpaceSmallest.w(),
              const ColoredChip.red('Cardiologue'),
            ],
          ),
          space,
          ...data.parts.map(_buildPart).intersperse(space),
          space,
          Align(
            alignment: Alignment.centerRight,
            child: context.labelSmall(data.date.yMMd()),
          )
        ],
      ),
    );
  }
}

Widget _buildPart(ObservationCardDataPart part) => part.map(
      hiddenObservation: _HiddenObservation.new,
      patientObservation: _PatientObservation.new,
      medicalHistory: _MedicalHistory.new,
      symptoms: _Symptoms.new,
      treatments: _Treatments.new,
      additionalObservation: _AdditionalObservation.new,
      rapport: _Rapport.new,
      appointment: _Appointment.new,
    );
