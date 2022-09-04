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
          // Text(
          //   data.observation,
          //   style: const TextStyle(
          //     fontSize: 14,
          //     fontWeight: FontWeight.w100,

          //   ),
          // ),
          context.bodyLarge(
            data.observation,
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
