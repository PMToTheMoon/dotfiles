part of '../observation_card.dart';

class _MedicalHistory extends StatelessWidget {
  const _MedicalHistory(this.data);

  final ObservationCardMedicalHistoryData data;

  @override
  Widget build(BuildContext context) {
    return TitledSection(
      title: context.l10n.patient_reason_title,
      subtitle: context.l10n.patient_reason_subtitle,
      children: [
        context.bodyMedium(data.observation),
      ],
    );
  }
}
