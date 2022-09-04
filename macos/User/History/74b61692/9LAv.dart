part of '../observation_card.dart';

class _AdditionalObservation extends StatelessWidget {
  const _AdditionalObservation(this.data);

  final ObservationCardAdditionalObservationData data;

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
