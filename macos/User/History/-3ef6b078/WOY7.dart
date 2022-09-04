import 'package:flutter/material.dart';
import 'package:translations/translations.dart';

class ProfilePopover extends StatelessWidget {
  const ProfilePopover({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: Text(context.l10n.profile_popover_personal_information),
        ),
      ],
    );
  }
}
