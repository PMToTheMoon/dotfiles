part of '../observation_card.dart';

class _MedicalHistory extends StatelessWidget {
  const _MedicalHistory(this.data);

  final ObservationCardMedicalHistoryData data;

  @override
  Widget build(BuildContext context) {
    return TitledSection(
      title: context.l10n.medical_history_title,
      child: Wrap(
        children: [
          data.items.map((e) => null),
        ],
      ),
    );
  }
}
