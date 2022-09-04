import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CompleteRecordButton extends StatelessWidget {
  const CompleteRecordButton({
    super.key,
  });

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingLarge.vertical(),
      child: HighlightedOutlinedButton(
        onPressed: _onCompleteRecordPressed,
        child: Text(context.l10n.hub_complete_button),
      ),
    );
  }
}
