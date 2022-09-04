part of '../observation_card.dart';

class _Close extends StatelessWidget {
  const _Close(this.data);

  final ObservationCardCloseData data;

  @override
  Widget build(BuildContext context) {
    return TitledSection(
      title: context.l10n.obs_close_title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HtmlView(htmlText: data.text),
        ],
      ),
    );
  }
}
