import 'package:common/common.dart';
import 'package:flutter/material.dart';

extension CompleteRecordBottomSheet on BuildContext {
  Future<void> showCompleteRecordBottomSheet({
    VoidCallback? onConsultationRapportPressed,
    VoidCallback? onExamRapportPressed,
    VoidCallback? onFollowUpPressed,
    VoidCallback? onCloseRecordPressed,
  }) {
    void closeAndCall(VoidCallback? callback) {
      Navigator.of(this, rootNavigator: true).pop();
      callback?.call();
    }

    return showZanalysBottomSheet(
      title: l10n.hub_bottom_sheet_title,
      child: SizedBox(
        height: 300,
        width: 200,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SpaceSmall.h(),
              OutlinedButton(
                onPressed: () => closeAndCall(onConsultationRapportPressed),
                child: Text(l10n.hub_bottom_sheet_consultation_rapport),
              ),
              const SpaceSmall.h(),
              OutlinedButton(
                onPressed: () => closeAndCall(onExamRapportPressed),
                child: Text(l10n.hub_bottom_sheet_exam_rapport),
              ),
              const SpaceSmall.h(),
              HighlightedOutlinedButton(
                onPressed: () => closeAndCall(onFollowUpPressed),
                child: Text(l10n.hub_bottom_sheet_followup),
              ),
              const SpaceSmall.h(),
              OutlinedButton(
                onPressed: () => closeAndCall(onCloseRecordPressed),
                child: Text(l10n.hub_bottom_sheet_close_record),
              ),
              const SpaceSmall.h(),
            ],
          ),
        ),
      ),
    );
  }
}
