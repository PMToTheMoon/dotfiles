import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:translations/translations.dart';

import 'user_account_form_controller.dart';

export 'user_account_form_controller.dart';
export 'user_account_form_snapshot.dart';

class UserAccountForm extends StatelessWidget {
  const UserAccountForm({
    super.key,
    required this.controller,
  });

  final UserAccountFormController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: TbtTextFormField(
                controller: controller.firstName,
                decoration: InputDecoration(
                  labelText: context.l10n.first_name_label,
                  hintText: context.l10n.first_name_hint,
                ),
              ),
            ),
            const SpaceSmall.w(),
            Expanded(
              child: TbtTextFormField(
                controller: controller.lastName,
                decoration: InputDecoration(
                  labelText: context.l10n.last_name_label,
                  hintText: context.l10n.last_name_hint,
                ),
              ),
            ),
          ],
        ),
        const SpaceSmall.h(),
        TbtTextFormField(
          controller: controller.email,
          decoration: InputDecoration(
            labelText: context.l10n.email_label,
            hintText: context.l10n.email_hint,
          ),
        ),
        const SpaceSmall.h(),
        TbtTextFormField(
          controller: controller.phone,
          decoration: InputDecoration(
            labelText: context.l10n.phone_label,
            hintText: context.l10n.phone_hint,
          ),
        ),
        const SpaceSmall.h(),
        TbtTextFormField(
          controller: controller.password,
          decoration: InputDecoration(
            labelText: context.l10n.password_label,
            hintText: context.l10n.password_hint,
          ),
        ),
      ],
    );
  }
}
