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
          SizedBox(
            height: 300,
            child: HtmlEditor(
              controller: HtmlEditorController(),
            ),
          ),
          context.bodyLarge(
            data.observation,
          ),
        ],
      ),
    );
  }
}
