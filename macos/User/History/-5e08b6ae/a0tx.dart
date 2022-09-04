import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:neat/neat.dart';
import 'package:translations/translations.dart';

class ExperienceContextualMenu extends StatelessWidget {
  const ExperienceContextualMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TbtContextualMenu(
      width: 157,
      icon: Icons.more_horiz,
      children: [
        ContextualMenuButton(
          onPressed: () {},
          child: Center(
            child: Text(
              context.l10n.professional_experience_contextual_menu_edit,
            ),
          ),
        ),
        ContextualMenuButton(
          onPressed: () {},
          child: Center(
            child: Text(
              context.l10n.professional_experience_contextual_menu_delete,
            ),
          ),
        ),
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
          const ExperienceContextualMenu(),
        ]),
        const SpaceSmallest(),
        Wrap(
          spacing: Dimensions.spaceSmaller,
          children: [
            ColoredIconText.lightBlue(
                Icons.business_center, experience.company),
            ColoredIconText.darkBlue(Icons.place, experience.location),
            ColoredIconText.darkPurple(
                Icons.calendar_month, experience.displayPeriod(context)),
          ],
        )
      ],
    );
  }
}
