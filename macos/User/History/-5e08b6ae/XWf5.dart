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
    required this.jobTitle,
    required this.company,
    required this.location,
    required this.period,
  });

  final ProfessionalExperience experience;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: [
          Expanded(child: context.headlineMedium(jobTitle)),
        ]),
        const SpaceSmallest(),
        Wrap(
          spacing: Dimensions.spaceSmaller,
          children: [
            ColoredIconText.lightBlue(Icons.business_center, company),
            ColoredIconText.darkBlue(Icons.place, location),
            ColoredIconText.darkPurple(Icons.calendar_month, period),
          ],
        )
      ],
    );
  }
}
