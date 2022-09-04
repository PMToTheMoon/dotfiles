part of '../observation_card.dart';

class _HiddenObservation extends StatelessWidget {
  const _HiddenObservation(this.data);

  final ObservationCardHiddenObservationData data;

  @override
  Widget build(BuildContext context) {
    return TitledSection(
      title: context.l10n.hidden_observation_title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          context.bodyLarge(
            data.observation,
            style: const TextStyle(
              color: Color(0xff7E8495),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
