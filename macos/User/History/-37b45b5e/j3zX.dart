import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:neat/neat.dart';
import 'package:translations/translations.dart';

class EducationContextualMenu extends StatelessWidget {
  const EducationContextualMenu({
    super.key,
    this.onEdit,
    this.onDelete,
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
            context.l10n.professional_education_contextual_menu_edit,
          ),
        ),
        ContextualMenuButton(
          onPressed: onDelete,
          child: context.labelMedium(
            context.l10n.professional_education_contextual_menu_delete,
          ),
        ),
      ],
    );
  }
}

class EducationHeader extends StatelessWidget {
  const EducationHeader({
    super.key,
    required this.education,
    this.onEdit,
    this.onDelete,
  });

  final Education education;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: [
          Expanded(child: context.headlineMedium(education.title)),
          EducationContextualMenu(
            onDelete: onDelete,
            onEdit: onEdit,
          ),
        ]),
        const SpaceSmallest(),
        Wrap(
          spacing: Dimensions.spaceSmaller,
          children: [
            ColoredIconText.lightBlue(Icons.business_center, education.school),
            ColoredIconText.darkBlue(Icons.place, education.location),
            ColoredIconText.darkPurple(
                Icons.calendar_month, education.displayPeriod(context)),
          ],
        )
      ],
    );
  }
}
