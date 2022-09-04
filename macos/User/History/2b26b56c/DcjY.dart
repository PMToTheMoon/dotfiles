import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'experience_full.dart';
import 'experience_header.dart';

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
      onTap: () => Actions.invoke(context, const ToggleUnfoldableItem()),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingLarge,
          vertical: Dimensions.paddingMedium,
        ),
        child: Unfoldable(
          unfold: unfolded,
          folded: ExperienceHeader(experience: experience),
          unfolded: ExperienceFull(experience: experience),
        ),
      ),
    );
  }
}
