class RapportFormCard extends StatelessWidget {
  const RapportFormCard({
    super.key,
  });

  void onConsultationSubmitted(NewGeneralRapportFormSnapshot snapshot) {
    final noConsultation = snapshot.consultation.contains(
      context.l10n.obs_no_consultation,
    );

    final userId = context.read<AuthBloc>().userId;
    final rapport = RapportGeneral(
      id: widget.hubState.record.rapportGeneral?.id ?? 0,
      recordId: widget.hubState.record.id,
      providerId: userId,
      synthesis: snapshot.hiddenReason,
      comment: snapshot.patientReason,
      // teletransmissionAutre: false,
    );
    context
        .read<ObservationsBloc>()
        .add(ObservationsEvent.generalRapportFormSubmitted(
          rapport: rapport,
          recordStatus: widget.hubState.record.status,
          completeRecord: noConsultation,
        ));
  }

  void onTeleExpertiseSubmitted(NewGeneralRapportFormSnapshot snapshot) {
    final noConsultation = snapshot.consultation.contains(
      context.l10n.obs_no_consultation,
    );
    final userId = context.read<AuthBloc>().userId;
    final rapport = RapportGeneral(
      id: widget.hubState.record.rapportGeneral?.id ?? 0,
      recordId: widget.hubState.record.id,
      providerId: userId,
      technicalProviderId: null,
      teleExpertiseSynthesis: snapshot.hiddenReason,
      teleExpertiseComment: snapshot.patientReason,
      teletransmissionAutre: false,
    );
    context
        .read<ObservationsBloc>()
        .add(ObservationsEvent.generalRapportFormSubmitted(
          rapport: rapport,
          completeRecord: noConsultation,
          recordStatus: widget.hubState.record.status,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final onFormSubmitted =
        widget.hubState.serviceRequest?.service == ServiceType.teleExpertise
            ? onTeleExpertiseSubmitted
            : onConsultationSubmitted;

    return Padding(
      padding: const PaddingSmaller.top(),
      child: NewGeneralRapportCard(
        onFormSubmitted: onFormSubmitted,
        request: RequestCard(
          from: widget.hubState.record.doctorFirstName ?? 'unknown',
          type: widget.hubState.serviceRequest!.service,
        ),
      ),
    );
  }
}
