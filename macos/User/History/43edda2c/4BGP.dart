import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:neat/neat.dart';
import 'package:translations/translations.dart';

class EducationExtension extends StatelessWidget {
  const EducationExtension({
    required this.education,
    super.key,
  });

  final Education education;

  @override
  Widget build(BuildContext context) {
    String effectiveDescription = education.description?.isNotEmpty == true
        ? education.description!
        : context.l10n.professional_education_empty_description_text;
    return Padding(
      padding: const PaddingSmall(top),
      child: context.bodyMedium(effectiveDescription),
    );
  }
}
