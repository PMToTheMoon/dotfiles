part of '../observation_card.dart';

class _MedicalInformation extends StatelessWidget {
  const _MedicalInformation(this.data);

  final ObservationCardMedicalInformationData data;

  @override
  Widget build(BuildContext context) {
    return TitledSection(
      title: context.l10n.medical_history_title,
      subtitle: context.l10n.medical_history_subtitle,
      child: Wrap(
        spacing: Dimensions.spaceSmallest,
        runSpacing: Dimensions.spaceSmallest,
        children: data.items.map((item) => ColoredChip.blue(item)).toList(),
      ),
    );
  }
}
