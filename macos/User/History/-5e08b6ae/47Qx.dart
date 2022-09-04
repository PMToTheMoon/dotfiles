import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:neat/neat.dart';

class ExperienceContextualMenu extends StatelessWidget {
  const ExperienceContextualMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TbtContextualMenu(
      icon: Icons.more_horiz,
      children: [
        ContextualMenuButton(child: Text("Test")),
        ContextualMenuButton(child: Text("Test 2")),
      ],
    );
  }
}

class ExperienceHeader extends StatelessWidget {
  const ExperienceHeader({
    super.key,
    required this.experience,
  });

  final ProfessionalExperience experience;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: [
          Expanded(child: context.headlineMedium(experience.title)),
        ]),
        const SpaceSmallest(),
        Wrap(
          spacing: Dimensions.spaceSmaller,
          children: [
            ColoredIconText.lightBlue(
                Icons.business_center, experience.company),
            ColoredIconText.darkBlue(Icons.place, experience.location),
            ColoredIconText.darkPurple(Icons.calendar_month, experience.period),
          ],
        )
      ],
    );
  }
}
