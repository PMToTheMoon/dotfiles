part of '../observation_card.dart';

class _Appointment extends StatelessWidget {
  const _Appointment(this.data);

  final ObservationCardAppointmentData data;

  @override
  Widget build(BuildContext context) {
    return TitledSection(
      title: context.l10n.obs_appointment_title,
      child: Align(
        alignment: Alignment.topLeft,
        child: Chip(
          label: Text(data.type),
        ),
      ),
    );
  }
}
