import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:neat/neat.dart';
import 'package:tech_by_tech/auth/login/widgets/login_form/login_form.dart';
import 'package:translations/translations.dart';

import 'bloc/login_bloc.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        authRepository: context.read(),
      ),
      child: _LoginPageBody(),
    );
  }
}

class _LoginPageBody extends StatelessWidget {
  const _LoginPageBody({
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
                const LoginForm(),
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
