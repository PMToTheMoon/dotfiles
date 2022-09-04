part of '../observation_card.dart';

class _AdditionalObservation extends StatelessWidget {
  const _AdditionalObservation(this.data);

  final ObservationCardAdditionalObservationData data;

  @override
  Widget build(BuildContext context) {
    return TitledSection(
      title: context.l10n.additional_observation_title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          context.bodyLarge(data.observation),
        ],
      ),
    );
  }
}
