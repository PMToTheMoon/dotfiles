import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:neat/neat.dart';
import 'package:tech_by_tech/auth/auth.dart';
import 'package:translations/translations.dart';

class SignInPageBody extends StatelessWidget {
  const SignInPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const PaddingLarger(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                context.displayMedium(
                  context.l10n.signin_title,
                  textAlign: TextAlign.center,
                ),
                const SpaceSmallest.h(),
                context.titleMedium(
                  context.l10n.signin_subtitle,
                  textAlign: TextAlign.center,
                ),
                const SpaceLargest.h(),
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
                const SpaceMedium.h(),
                Row(children: [
                  Checkbox(value: true, onChanged: (_) {}),
                  const SpaceSmallest.w(),
                  context.bodyMedium(''),
                ]),
                const SpaceMedium.h(),
                Align(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(context.l10n.signin_button),
                  ),
                )
              ],
            ),
          ),
        ),
        const SpaceSmall.w(),
        Row(
          children: [
            const SpaceSmall.w(),
            Flexible(
              child: context.bodyLarge(
                context.l10n.signin_login_text,
              ),
            ),
            TextButton(
              onPressed: () => RouteState.of(context).goTo('/sign-in'),
              child: Text(
                context.l10n.login_signin_button,
                style: TextStyle(
                  color: context.colorScheme.primary,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
