import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:neat/neat.dart';
import 'package:translations/translations.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 85,
              left: 154,
              right: 154,
              bottom: 110,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                context.displayMedium(
                  context.l10n.login_title,
                  textAlign: TextAlign.center,
                ),
                const SpaceSmallest.h(),
                context.titleMedium(
                  context.l10n.login_subtitle,
                  textAlign: TextAlign.center,
                ),
                const SpaceLargest.h(),
                TbtTextFormField(
                  textInputAction: TextInputAction.next,
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
                const SpaceSmall.h(),
                Row(children: [
                  Checkbox(value: true, onChanged: (_) {}),
                  const SpaceSmallest.w(),
                  Expanded(
                    child: context.bodyMedium(
                      context.l10n.login_remember_credentials_text,
                    ),
                  ),
                ]),
                const SpaceMedium.h(),
                Align(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(context.l10n.login_button),
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
                context.l10n.login_signin_link_text,
              ),
            ),
            TextButton(
              onPressed: () => RouteState.of(context).goTo('/sign-in'),
              child: Text(
                context.l10n.login_signin_link_button,
                style: TextStyle(
                  color: context.colorScheme.primary,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
