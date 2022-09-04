import 'package:bubble_box/bubble_box.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:translations/translations.dart';

class ProfilePopover extends StatelessWidget {
  const ProfilePopover({
    this.onMyProfilePressed,
    this.onPersonalInformationPressed,
    this.onDocumentsPressed,
    this.onLogoutPressed,
    super.key,
  });

  final VoidCallback? onMyProfilePressed;
  final VoidCallback? onPersonalInformationPressed;
  final VoidCallback? onDocumentsPressed;
  final VoidCallback? onLogoutPressed;

  @override
  Widget build(BuildContext context) {
    return BubbleBox(
      maxWidth: MediaQuery.of(context).size.width * 0.8,
      shape: BubbleShapeBorder(
        border: BubbleBoxBorder(
          color: Colors.blue,
          width: 3,
        ),
        position: const BubblePosition.center(0),
        direction: BubbleDirection.right,
      ),
      backgroundColor: Colors.green.withOpacity(0.8),
      child: Padding(
        padding: const PaddingSmaller(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: onMyProfilePressed,
              child: Text(context.l10n.profile_popover_profile_button),
            ),
            TextButton(
              onPressed: onPersonalInformationPressed,
              child: Text(context.l10n.profile_popover_personal_information),
            ),
            TextButton(
              onPressed: onDocumentsPressed,
              child: Text(context.l10n.profile_popover_documents_button),
            ),
            TextButton(
              onPressed: onLogoutPressed,
              child: Text(context.l10n.profile_popover_logout_button),
            ),
          ],
        ),
      ),
    );
  }
}
