part of '../observation_card.dart';

class _Rapport extends StatelessWidget {
  const _Rapport(this.data);

  final ObservationCardRapportData data;

  @override
  Widget build(BuildContext context) {
    return TitledSection(
      title: context.l10n.obs_report_title,
      subtitle: context.l10n.obs_report_subtitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HtmlView(htmlText: data.observation),
          // context.bodyLarge(data.observation),
        ],
      ),
    );
  }
}
