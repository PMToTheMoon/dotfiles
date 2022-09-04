import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'experience_extension.dart';
import 'experience_header.dart';

class UnfoldableExperienceCard extends StatefulWidget {
  const UnfoldableExperienceCard({
    required this.experience,
    super.key,
  });

  final ProfessionalExperience experience;

  @override
  State<UnfoldableExperienceCard> createState() =>
      _UnfoldableExperienceCardState();
}

class _UnfoldableExperienceCardState extends State<UnfoldableExperienceCard> {
  bool _editing = false;

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
            header: ExperienceHeader(experience: widget.experience),
            extension: ExperienceExtension(experience: widget.experience),
          ),
        ),
      ),
    );
  }
}
