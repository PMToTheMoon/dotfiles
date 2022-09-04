import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class CandidateSkillsView extends StatelessWidget {
  static CandidateSkillsView builder(BuildContext context) =>
      const CandidateSkillsView();

  const CandidateSkillsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        context.headlineMedium('Ajouter une nouvelle compétence'),
        const SpaceSmallest.h(),
        context.bodyMedium(
          'Sélectionne ou saisie tes compétences et appuyez sur entrer pour valider',
        ),
        const SpaceSmallest.h(),
        IntrinsicHeight(
          // height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                child: ChipEditorField(),
              ),
              const SpaceSmaller.w(),
              ElevatedButton(
                onPressed: () {},
                child: Text("Ajouter à la liste"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
