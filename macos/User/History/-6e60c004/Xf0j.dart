import 'package:flutter/material.dart';

import 'sign_in_form_controller.dart';

export 'sign_in_form_controller.dart';
export 'sign_in_form_snapshot.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
    required this.controller,
  });

  final SignInFormController controller;

  @override
  Widget build(BuildContext context) {
    return   Row(
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
                );
  }
}
