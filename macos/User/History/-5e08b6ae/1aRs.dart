import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:neat/neat.dart';
import 'package:tech_by_tech/candidate/profile/professional_experiences/bloc/candidate_professional_experiences_bloc.dart';
import 'package:translations/translations.dart';

class ExperienceContextualMenu extends StatelessWidget {
  const ExperienceContextualMenu({
    super.key,
  });

  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return TbtContextualMenu(
      width: 157,
      icon: Icons.more_horiz,
      children: [
        ContextualMenuButton(
          onPressed: onEdit,
          child: context.labelMedium(
            context.l10n.professional_experience_contextual_menu_edit,
          ),
        ),
        ContextualMenuButton(
          onPressed: onDelete,
          child: context.labelMedium(
            context.l10n.professional_experience_contextual_menu_delete,
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
    this.onEdit,
    this.onDelete,
  });

  final ProfessionalExperience experience;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: [
          Expanded(child: context.headlineMedium(experience.title)),
          ExperienceContextualMenu(
            experienceId: experience.id,
          ),
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
