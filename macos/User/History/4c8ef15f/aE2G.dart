part of '../observation_card.dart';

class _PatientObservation extends StatelessWidget {
  const _PatientObservation(this.data);

  final ObservationCardPatientObservationData data;

  @override
  Widget build(BuildContext context) {
    return TitledSection(
      title: context.l10n.hidden_reason_title,
      children: [
        context.bodyMedium(data.observation),
      ],
    );
  }
}
