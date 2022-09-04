part of '../observation_card.dart';

class _Symptoms extends StatelessWidget {
  const _Symptoms(this.data);

  final ObservationCardSymptomsData data;

  @override
  Widget build(BuildContext context) {
    return TitledSection(
      title: context.l10n.symptoms_title,
      child: Wrap(
        spacing: Dimensions.spaceSmallest,
        runSpacing: Dimensions.spaceSmallest,
        children: data.items.map((item) => ColoredChip.orange(item)).toList(),
      ),
    );
  }
}
