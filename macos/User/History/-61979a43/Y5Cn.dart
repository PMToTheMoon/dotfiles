part of '../observation_card.dart';

class _Conclusion extends StatelessWidget {
  const _Conclusion(this.data);

  final ObservationCardRapportData data;

  @override
  Widget build(BuildContext context) {
    return TitledSection(
      title: context.l10n.obs_rapport_title,
      subtitle: context.l10n.obs_rapport_subtitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          context.bodyLarge(data.observation),
        ],
      ),
    );
  }
}
