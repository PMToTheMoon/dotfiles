import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:translations/translations.dart';

class ProfilePopover extends StatelessWidget {
  const ProfilePopover({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingSmaller(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(context.l10n.profile_popover_profile_button),
          ),
          TextButton(
            onPressed: () {},
            child: Text(context.l10n.profile_popover_personal_information),
          ),
          TextButton(
            onPressed: () {},
            child: Text(context.l10n.profile_popover_documents_button),
          ),
          TextButton(
            onPressed: () {},
            child: Text(context.l10n.profile_popover_logout_button),
          ),
        ],
      ),
    );
  }
}
