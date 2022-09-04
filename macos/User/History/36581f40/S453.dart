import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

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
          flex: 3,
          child: body,
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: context.colorScheme.tertiary,
            padding: const PaddingLarge.all(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                context.displayLarge(
                  'Le monde du travail évolue, avec vous !',
                  style: TextStyle(color: context.colorScheme.onTertiary),
                  textAlign: TextAlign.center,
                ),
                context.bodyLarge(
                  'Faites décoller votre carrière grâce à notre plateforme de recrutement, où candidats et entreprises se rencontrent en un clic.',
                  style: TextStyle(color: context.colorScheme.onTertiary),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
