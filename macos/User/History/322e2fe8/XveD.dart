import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:translations/translations.dart';

import 'user_personal_information_form_controller.dart';

export 'user_personal_information_form_controller.dart';
export 'user_personal_information_form_snapshot.dart';

class UserPersonalInformationForm extends StatelessWidget {
  const UserPersonalInformationForm({
    required this.controller,
    super.key,
    this.onChanged,
  });

  final UserPersonalInformationFormController controller;
  final VoidCallback? onChanged;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      onChanged: onChanged,
      child: Column(
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
      ),
    );
  }
}
