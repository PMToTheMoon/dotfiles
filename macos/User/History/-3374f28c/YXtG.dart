import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:models/models.dart';

import 'package:zanalys/record/hub/bloc/hub_bloc.dart';
import 'bloc/observations_bloc.dart';
import 'widgets/complement_form_card.dart';
import 'widgets/complete_record_button.dart';
import 'widgets/rapport_form_card.dart';
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
        effectiveRecord: hubState.effectiveRecord,
        recordService: GetIt.I.get(),
      ),
      child: BlocListener<ObservationsBloc, ObservationsState>(
        listener: _onObservationsStateChanged,
        child: _ObservationsView(
          hub: hubState,
        ),
      ),
    );
  }
}

class _ObservationsView extends StatefulWidget {
  const _ObservationsView({
    required this.hub,
    super.key,
  });

  final HubReady hub;

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
        from: widget.hub.effectiveRecord.doctorFirstName ?? 'unknown',
        type: widget.hub.serviceRequest!.service,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final observationViewState =
        context.select((ObservationsBloc bloc) => bloc.state);

    // Actually only general forms are supported
    final showRapportForm = widget.hub.serviceRequest != null &&
        widget.hub.effectiveRecord.type == RecordType.general &&
        widget.hub.effectiveRecord.status != RecordStatus.closed;

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
                  widget.hub.effectiveRecord.toInitialObservationCardData(
                cacheService: GetIt.I.get(),
              )),
              ObservationCards(
                hub: widget.hub,
                avatarCacheService: avatarCacheService,
              ),
              if (showCompleteButton) const CompleteRecordButton(),
              if (showRapportForm) RapportFormCard(hub: widget.hub),
              if (showComplementForm)
                ComplementFormCard(
                  complementType: observationViewState.complementType,
                ),
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
