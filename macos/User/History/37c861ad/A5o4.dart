import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:neat/neat.dart';
import 'package:tech_by_tech/auth/auth.dart';

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
            padding: EdgeInsets.only(
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
                  'Bienvenue chez TechByTech !',
                  textAlign: TextAlign.center,
                ),
                const SpaceSmallest.h(),
                context.titleMedium(
                  'Veuillez entrez vos informations.',
                  textAlign: TextAlign.center,
                ),
                const SpaceLargest.h(),
                Row(
                  children: [
                    Expanded(
                      child: TbtTextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Prénom',
                        ),
                      ),
                    ),
                    const SpaceSmall.w(),
                    Expanded(
                      child: TbtTextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Nom',
                        ),
                      ),
                    ),
                  ],
                ),
                const SpaceSmall.h(),
                TbtTextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Adresse email',
                  ),
                ),
                const SpaceSmall.h(),
                TbtTextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Mot de passe',
                  ),
                ),
                const SpaceMedium.h(),
                Row(children: [
                  Checkbox(value: true, onChanged: (_) {}),
                  const SpaceSmallest.w(),
                  context.bodyMedium(
                      'J’accepte les  Conditions Générales d’Utilisations de TechByTech'),
                ]),
                const SpaceMedium.h(),
                Align(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("S'enregister"),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
