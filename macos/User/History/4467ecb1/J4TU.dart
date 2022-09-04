import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:neat/neat.dart';
import 'package:tech_by_tech/auth/sign_in/widgets/sign_in_form/sign_in_form.dart';
import 'package:translations/translations.dart';

class SignInPageBody extends StatefulWidget {
  const SignInPageBody({
    super.key,
  });

  @override
  State<SignInPageBody> createState() => _SignInPageBodyState();
}

class _SignInPageBodyState extends State<SignInPageBody> {
  final _formController = SignInFormController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 45,
              left: 95,
              right: 95,
              bottom: 60,
            ),
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
                SignInForm(
                  controller: _formController,
                ),
                const SpaceMedium.h(),
                Row(children: [
                  Checkbox(value: true, onChanged: (_) {}),
                  const SpaceSmallest.w(),
                  Flexible(
                    child: context.bodyMedium(
                      context.l10n.login_remember_credentials_text,
                    ),
                  ),
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
                context.l10n.signin_login_link_text,
              ),
            ),
            TextButton(
              onPressed: () => RouteState.of(context).goTo('/login'),
              child: Text(
                context.l10n.signin_login_link_button,
                style: TextStyle(
                  color: context.colorScheme.secondary,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
