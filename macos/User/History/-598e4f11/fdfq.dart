import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

import 'complete_record_bottom_sheet.dart';
import '../bloc/observations_bloc.dart';

class CompleteRecordButton extends StatelessWidget {
  const CompleteRecordButton({
    super.key,
  });

  Future<void> _onCompleteRecordPressed(BuildContext context) async {
    final ObservationsBloc bloc = context.read();

    // context.read<HubBloc>().add(const HubEvent.fetchRequested());

    await context.showCompleteRecordBottomSheet(
      onConsultationRapportPressed: () => bloc.add(
        const ObservationsEvent.addComplementButtonPressed(
          complementType: ComplementType.crConsultation,
        ),
      ),
      onExamRapportPressed: () => bloc.add(
        const ObservationsEvent.addComplementButtonPressed(
          complementType: ComplementType.exam,
        ),
      ),
      onFollowUpPressed: () => bloc.add(
        const ObservationsEvent.addComplementButtonPressed(
          complementType: ComplementType.recordFollowup,
        ),
      ),
      onCloseRecordPressed: () => bloc.add(
        const ObservationsEvent.addComplementButtonPressed(
          complementType: ComplementType.recordFollowup,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingLarge.vertical(),
      child: HighlightedOutlinedButton(
        onPressed: () => _onCompleteRecordPressed(context),
        child: Text(context.l10n.hub_complete_button),
      ),
    );
  }
}
