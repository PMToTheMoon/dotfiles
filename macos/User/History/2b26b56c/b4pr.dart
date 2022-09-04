import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/candidate/profile/professional_experiences/widgets/experience_header.dart';

class UnfoldableExperienceCard extends StatelessWidget {
  const UnfoldableExperienceCard({
    required this.unfolded,
    required this.experience,
    super.key,
  });

  final bool unfolded;
  final ProfessionalExperience experience;

  @override
  Widget build(BuildContext context) {
    return TbtHoverCard(
      onTap: () => Actions.invoke(ToggleUnfoldableItem()),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingLarge,
          vertical: Dimensions.paddingMedium,
        ),
        child: unfolded == false
            ? ExperienceHeader(experience: experience)
            : ExperienceHeader(experience: experience),
      ),
    );
  }
}
