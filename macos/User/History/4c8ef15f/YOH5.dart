part of '../observation_card.dart';

class _PatientObservation extends StatelessWidget {
  const _PatientObservation(this.data);

  final ObservationCardPatientObservationData data;

  @override
  Widget build(BuildContext context) {
    return TitledSection(
      title: context.l10n.patient_reason_title,
      subtitle: context.l10n.patient_reason_subtitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          context.bodyMedium(data.observation),
        ],
      ),
    );
  }
}
