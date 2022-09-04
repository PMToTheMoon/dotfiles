import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:neat/neat.dart';
import 'package:translations/translations.dart';

class ExperienceExtension extends StatelessWidget {
  const ExperienceExtension({
    required this.experience,
    super.key,
  });

  final ProfessionalExperience experience;

  @override
  Widget build(BuildContext context) {
    String effectiveDescription = experience.description?.isNotEmpty == true
        ? experience.description!
        : context.l10n.professional_experience_empty_description_text;
    return Padding(
      padding: const PaddingSmall(top),
      child: context.bodyMedium(effectiveDescription),
    );
  }
}
