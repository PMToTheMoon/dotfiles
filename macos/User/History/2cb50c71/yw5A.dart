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
        context.headlineMedium('Skills'),
        SizedBox(
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(child: const ChipEditorField()),
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
