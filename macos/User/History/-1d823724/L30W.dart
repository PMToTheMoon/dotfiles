import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:translations/translations.dart';

import 'candidate_information_form_controller.dart';

export 'candidate_information_form_controller.dart';
export 'candidate_information_form_snapshot.dart';

class CandidateInformationForm extends StatelessWidget {
  const CandidateInformationForm({
    super.key,
    required this.controller,
  });

  final CandidateInformationFormController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: TbtTextFormField(
                decoration: InputDecoration(
                  labelText: context.l10n.first_name_label,
                  hintText: context.l10n.first_name_hint,
                ),
              ),
            ),
            const SpaceSmall.w(),
            Expanded(
              child: TbtTextFormField(
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
          decoration: InputDecoration(
            labelText: context.l10n.email_label,
            hintText: context.l10n.email_hint,
          ),
        ),
        const SpaceSmall.h(),
        TbtTextFormField(
          decoration: InputDecoration(
            labelText: context.l10n.password_label,
            hintText: context.l10n.password_hint,
          ),
        ),
      ],
    );
  }
}
