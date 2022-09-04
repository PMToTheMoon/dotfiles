import 'package:common/common.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:translations/translations.dart';

class ProfilePopover extends StatelessWidget {
  const ProfilePopover({
    this.onMyProfilePressed,
    this.onPersonalInformationPressed,
    this.onDocumentsPressed,
    this.onLogoutPressed,
    this.onExitHoverRegion,
    this.hoverRegionMargin = EdgeInsets.zero,
    super.key,
  });

  final EdgeInsetsGeometry hoverRegionMargin;
  final void Function(PointerExitEvent)? onExitHoverRegion;
  final VoidCallback? onMyProfilePressed;
  final VoidCallback? onPersonalInformationPressed;
  final VoidCallback? onDocumentsPressed;
  final VoidCallback? onLogoutPressed;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: onExitHoverRegion,
      child: Padding(
        padding: hoverRegionMargin,
        child: Container(
          //color: context.colorScheme.surface,//
          color: Colors.red,
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
                  child:
                      Text(context.l10n.profile_popover_personal_information),
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
        ),
      ),
    );
  }
}
