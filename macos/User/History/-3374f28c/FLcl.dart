import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intersperse/intersperse.dart';
import 'package:models/models.dart';
import 'package:zanalys/auth/bloc/auth_bloc.dart';
import 'package:zanalys/record/hub/bloc/hub_bloc.dart';
import 'package:zanalys/record/hub/observations/widgets/complement_form_card.dart';
import 'package:zanalys/record/hub/observations/widgets/rapport_form_card.dart';

import 'bloc/observations_bloc.dart';
import 'widgets/new_general_rapport_card/new_general_rapport_card.dart';
import 'widgets/complete_record_bottom_sheet.dart';
import 'widgets/new_complement_card/new_complement_form.dart';
import 'widgets/new_complement_card/new_complement_form_card.dart';
import 'widgets/observation_card/observation_card.dart';
import 'widgets/observation_cards.dart';

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

  Future<void> _onCompleteRecordPressed(BuildContext context) async {
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

  Widget _buildCompleteButton() {
    return Padding(
      padding: const PaddingLarge.vertical(),
      child: HighlightedOutlinedButton(
        onPressed: _onCompleteRecordPressed,
        child: Text(context.l10n.hub_complete_button),
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

    // Actually only general forms are supported
    final showRapportForm = widget.hubState.serviceRequest != null &&
        widget.hubState.record.type == RecordType.general;

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
              ObservationCards(
                hub: widget.hubState,
                avatarCacheService: avatarCacheService,
              ),
              if (showCompleteButton) _buildCompleteButton(),
              if (showRapportForm) RapportFormCard(hub: widget.hubState),
              if (showComplementForm) const ComplementFormCard(),
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
