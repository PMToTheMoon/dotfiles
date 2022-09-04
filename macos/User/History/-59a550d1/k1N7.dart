part of '../observation_card.dart';

class _Rapport extends StatelessWidget {
  const _Rapport(this.data);

  final ObservationCardRapportData data;

  @override
  Widget build(BuildContext context) {
    return TitledSection(
      title: context.l10n.obs,
      subtitle: context.l10n.patient_observation_subtitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          context.bodyMedium(data.observation),
        ],
      ),
    );
  }
}
