import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intersperse/intersperse.dart';
import 'package:models/models.dart';
import 'package:zanalys/auth/bloc/auth_bloc.dart';
import 'package:zanalys/record/hub/bloc/hub_bloc.dart';

import 'bloc/observations_bloc.dart';
import 'widgets/new_general_rapport_card/new_general_rapport_card.dart';
import 'widgets/complete_record_bottom_sheet.dart';
import 'widgets/new_complement_card/new_complement_form.dart';
import 'widgets/new_complement_card/new_complement_form_card.dart';
import 'widgets/observation_card/observation_card.dart';

class ObservationsView extends StatelessWidget {
  const ObservationsView({
    required this.hubState,
    super.key,
  });

  final HubReady hubState;

  void _onObservationsStateChanged(
    BuildContext context,
    ObservationsState state,
  ) {
    if (state is ObservationsError) {
      context.showErrorSnackBar();
    } else if (state is ObservationsSuccess) {
      context.read<HubBloc>().add(const HubEvent.fetchRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ObservationsBloc(
        recordId: hubState.record.id,
        recordService: GetIt.I.get(),
      ),
      child: BlocListener<ObservationsBloc, ObservationsState>(
        listener: _onObservationsStateChanged,
        child: _ObservationsView(
          hubState: hubState,
        ),
      ),
    );
  }
}

class _ObservationsView extends StatefulWidget {
  const _ObservationsView({
    required this.hubState,
    super.key,
  });

  final HubReady hubState;

  @override
  State<_ObservationsView> createState() => _ObservationsViewState();
}

class _ObservationsViewState extends State<_ObservationsView>
    with AutomaticKeepAliveClientMixin {
  final AvatarCacheService avatarCacheService = GetIt.I.get();

  Future<void> _onCompleteRecordPressed() async {
    final ObservationsBloc bloc = context.read();

    // context.read<HubBloc>().add(const HubEvent.fetchRequested());

    await context.showCompleteRecordBottomSheet(
      onConsultationRapportPressed: () => bloc.add(
        const ObservationsEvent.addComplementButtonPressed(
            complementType: ComplementType.crConsultation),
      ),
      onExamRapportPressed: () => bloc.add(
        const ObservationsEvent.addComplementButtonPressed(
            complementType: ComplementType.exam),
      ),
      onFollowUpPressed: () => bloc.add(
        const ObservationsEvent.addComplementButtonPressed(
            complementType: ComplementType.recordFollowup),
      ),
      onCloseRecordPressed: () {},
    );
  }

  ObservationCardData? _buildRapportForRecord(Record record) {
    return record.rapportGeneral?.toObservationCardData(
      record: record,
      avatarCacheService: avatarCacheService,
    );
  }

  Iterable<ObservationCardData>? _buildComplementsForRecord(Record record) {
    return record.complements?.map(
      (complement) => complement.toComplementObservationCardData(
        parentRecord: widget.hubState.record,
        cacheService: GetIt.I.get(),
        // record: widget.hubState.record,
      ),
    );
  }

  Iterable<ObservationCardData> _buildObservationsDataFromRecord(
      Record record) {
    final rapport = _buildRapportForRecord(record);
    final complements = _buildComplementsForRecord(record);
    return [
      if (rapport != null) rapport,
      ...?complements,
      for (final Record child in record.childRecords ?? [])
        ...?_buildComplementsForRecord(child)
    ];
  }

  Iterable<Widget> _buildObservationCardsFromData(
    List<ObservationCardData> data,
  ) {
    data.sort((a, b) => a.date.compareTo(b.date));
    return data.map((d) => ObservationCard(d));
  }

  Widget _buildRequestCard() {
    return Padding(
      padding: const PaddingSmaller.bottom(),
      child: RequestCard(
        from: widget.hubState.record.doctorFirstName ?? 'unknown',
        type: widget.hubState.serviceRequest!.service,
      ),
    );
  }

  Widget _buildObservationCards(List<ObservationCardData> observationsData) {
    final recordCards = _buildObservationCardsFromData(observationsData)
        .intersperse(const SpaceSmaller.h());
    if (observationsData.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SpaceSmaller(),
        ...recordCards,
      ],
    );
  }

  Widget _buildCompleteButton() {
    return Padding(
      padding: const PaddingLarge.vertical(),
      child: HighlightedOutlinedButton(
        onPressed: _onCompleteRecordPressed,
        child: Text(context.l10n.hub_complete_button),
      ),
    );
  }

  Widget _buildRapportFormCard() {
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
            noConsultation: noConsultation,
          ));
    }

    void onTeleExpertiseSubmitted(NewGeneralRapportFormSnapshot snapshot) {
      final noConsultation = snapshot.consultation.contains(
        context.l10n.obs_no_consultation,
      );
      String? teleExpertiseSynthese;
      String? teleExpertiseComment;
      String? synthese;
      String? comment;
      if (widget.hubState.serviceRequest?.service ==
          ServiceType.teleExpertise) {
        teleExpertiseSynthese = snapshot.hiddenReason;
        teleExpertiseComment = snapshot.hiddenReason;
      }
      final recordId = context.read<HubBloc>().recordId;
      final userId = context.read<AuthBloc>().userId;
      final rapport = RapportGeneral(
        id: 0,
        recordId: recordId,
        providerId: userId,
        technicalProviderId: null,
        synthesis: snapshot.hiddenReason,
        teleExpertiseSynthesis: snapshot.hiddenReason,
        comment: snapshot.patientReason,
        teleExpertiseComment: snapshot.patientReason,
        teletransmissionAutre: false,
      );
      context
          .read<ObservationsBloc>()
          .add(ObservationsEvent.generalRapportFormSubmitted(
            rapport: rapport,
            noConsultation: noConsultation,
          ));
    }

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

  Widget _buildComplementFormCard() {
    void onSubmitted(NewComplementFormSnapshot snapshot) {
      final recordId = context.read<HubBloc>().recordId;
      final userId = context.read<AuthBloc>().userId;
      final complement = RecordComplement(
        id: 0,
        recordId: recordId,
        patientObservation: snapshot.patientReason,
        hiddenObservation: snapshot.hiddenReason,
        creationDate: null,
        lastModificationDate: null,
        creatorId: userId!,
        type: ComplementType.exam,
      );
      context
          .read<ObservationsBloc>()
          .add(ObservationsEvent.complementFormSubmitted(
            complement: complement,
          ));
    }

    return Padding(
      padding: const PaddingSmaller.top(),
      child: NewComplementFormCard(
        onFormSubmitted: onSubmitted,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final observationViewState =
        context.select((ObservationsBloc bloc) => bloc.state);
    final observationsData =
        _buildObservationsDataFromRecord(widget.hubState.record);

    final showRapportForm = widget.hubState.serviceRequest != null;
    final showComplementForm =
        observationViewState is ObservationsDisplayComplementForm &&
            showRapportForm == false;
    final showCompleteButton =
        showRapportForm == false && showComplementForm == false;
    return SingleChildScrollView(
      child: FormAutoScroll(
        child: Padding(
          padding: const PaddingSmaller(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (showRapportForm) _buildRequestCard(),
              ObservationCard(
                  widget.hubState.record.toInitialObservationCardData(
                cacheService: GetIt.I.get(),
              )),
              _buildObservationCards(observationsData.toList()),
              if (showCompleteButton) _buildCompleteButton(),
              if (showRapportForm) _buildRapportFormCard(),
              if (showComplementForm) _buildComplementFormCard(),
              const KeyboardSpace(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
