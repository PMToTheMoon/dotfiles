import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:zanalys/record/hub/bloc/hub_bloc.dart';

import 'new_general_rapport_card/new_general_rapport_card.dart';

class RapportFormCard extends StatelessWidget {
  const RapportFormCard({
    super.key,
  });

  final HubReady hub;

  void onConsultationSubmitted(NewGeneralRapportFormSnapshot snapshot) {
    final noConsultation = snapshot.consultation.contains(
      context.l10n.obs_no_consultation,
    );

    final userId = context.read<AuthBloc>().userId;
    final rapport = RapportGeneral(
      id: hub.record.rapportGeneral?.id ?? 0,
      recordId: hub.record.id,
      providerId: userId,
      synthesis: snapshot.hiddenReason,
      comment: snapshot.patientReason,
      // teletransmissionAutre: false,
    );
    context
        .read<ObservationsBloc>()
        .add(ObservationsEvent.generalRapportFormSubmitted(
          rapport: rapport,
          recordStatus: hub.record.status,
          completeRecord: noConsultation,
        ));
  }

  void onTeleExpertiseSubmitted(NewGeneralRapportFormSnapshot snapshot) {
    final noConsultation = snapshot.consultation.contains(
      context.l10n.obs_no_consultation,
    );
    final userId = context.read<AuthBloc>().userId;
    final rapport = RapportGeneral(
      id: hub.record.rapportGeneral?.id ?? 0,
      recordId: hub.record.id,
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
          recordStatus: hub.record.status,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final onFormSubmitted =
        hub.serviceRequest?.service == ServiceType.teleExpertise
            ? onTeleExpertiseSubmitted
            : onConsultationSubmitted;

    return Padding(
      padding: const PaddingSmaller.top(),
      child: NewGeneralRapportCard(
        onFormSubmitted: onFormSubmitted,
        request: RequestCard(
          from: hub.record.doctorFirstName ?? 'unknown',
          type: hub.serviceRequest!.service,
        ),
      ),
    );
  }
}
