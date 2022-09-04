part of '../observation_card.dart';

class _HiddenObservation extends StatelessWidget {
  const _HiddenObservation(this.data);

  final ObservationCardHiddenObservationData data;

  @override
  Widget build(BuildContext context) {
    return TitledSection(
      title: context.l10n.hidden_reason_title,
      children: [
        context.bodyMedium(data.observation,
            style: TextStyle(
                // color: context.colorScheme.onSurfaceVariant,
                )),
      ],
    );
  }
}
