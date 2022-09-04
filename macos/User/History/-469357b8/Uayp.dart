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
    return context.bodyMedium(experience.description ?? context.l10n.);
  }
}
