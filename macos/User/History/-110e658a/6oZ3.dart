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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: OutlinedButton(
              onPressed: () => closeAndCall(onConsultationRapportPressed),
              child: FittedBox(
                child: Text(l10n.hub_bottom_sheet_consultation_rapport),
              ),
            ),
          ),
          const SpaceSmaller.h(),
          Flexible(
            child: OutlinedButton(
              onPressed: () => closeAndCall(onExamRapportPressed),
              child: FittedBox(
                child: Text(l10n.hub_bottom_sheet_exam_rapport),
              ),
            ),
          ),
          const SpaceSmaller.h(),
          Flexible(
            child: HighlightedOutlinedButton(
              onPressed: () => closeAndCall(onFollowUpPressed),
              child: Text(l10n.hub_bottom_sheet_followup),
            ),
          ),
          const SpaceSmaller.h(),
          Flexible(
            child: OutlinedButton(
              onPressed: () => closeAndCall(onCloseRecordPressed),
              child: Text(l10n.hub_bottom_sheet_close_record),
            ),
          ),
          const SpaceSmall.h(),
        ],
      ),
    );
  }
}
