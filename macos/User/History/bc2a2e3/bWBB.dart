import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class UnfoldableExperienceCard extends StatelessWidget {
  const UnfoldableExperienceCard({
    required this.experience,
    super.key,
  });

  final ProfessionalExperience experience;

  @override
  Widget build(BuildContext context) {
    return UnfoldableListItem(
      builder: (context, unfolded) => TbtHoverCard(
        onTap: () => Actions.invoke(context, const ToggleUnfoldableItem()),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingLarge,
            vertical: Dimensions.paddingMedium,
          ),
          child: Unfoldable(
            unfolded: unfolded,
            header: ExperienceHeader(experience: experience),
            extension: ExperienceExtension(experience: experience),
          ),
        ),
      ),
    );
  }
}
