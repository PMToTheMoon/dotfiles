import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:tech_by_tech/auth/widgets/auth_app_bar.dart';

class AuthPageShell extends StatelessWidget {
  const AuthPageShell({
    required this.body,
    super.key,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: Scaffold(
            appBar: authAppBar(context),
            body: Container(
              color: context.colorScheme.surface,
              child: Card(
                margin: const PaddingLargest.horizontal(),
                child: Padding(
                  padding: const PaddingLargest(),
                  child: body,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            color: context.colorScheme.tertiary,
            padding: const EdgeInsets.all(130),
            child: Align(
              alignment: const Alignment(0, -0.25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    child: Column(
                      children: [
                        context.displayLarge(
                          'Le monde du',
                          style:
                              TextStyle(color: context.colorScheme.onTertiary),
                          textAlign: TextAlign.center,
                        ),
                        const SpaceSmall.h(),
                        context.displayLarge(
                          'travail évolue,',
                          style:
                              TextStyle(color: context.colorScheme.onTertiary),
                          textAlign: TextAlign.center,
                        ),
                        const SpaceSmall.h(),
                        context.displayLarge(
                          'avec vous !',
                          style:
                              TextStyle(color: context.colorScheme.onTertiary),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SpaceLarge.h(),
                  context.bodyLarge(
                    'Faites décoller votre carrière grâce à notre plateforme de recrutement, où candidats et entreprises se rencontrent en un clic.',
                    style: TextStyle(
                      color: context.colorScheme.onTertiary,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
