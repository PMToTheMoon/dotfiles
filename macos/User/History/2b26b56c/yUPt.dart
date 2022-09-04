import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import '../bloc/candidate_professional_experiences_bloc.dart';
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
  final _key = GlobalKey();

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
          child: AnimatedSwitcher(
            key: _key,
            duration: Duration(seconds: 1),
            transitionBuilder: (child, anim) => ScaleTransition(
              child: child,
              scale: anim,
            ),
            child: _editing
                ? GestureDetector(
                    onTap: () => setState(() {
                      _editing = false;
                    }),
                    child: Container(
                      color: Colors.red,
                      height: 200,
                    ),
                  )
                : Unfoldable(
                    unfolded: unfolded,
                    header: ExperienceHeader(
                      experience: widget.experience,
                      onEdit: () => setState(() {
                        _editing = true;
                      }),
                      onDelete: () => context
                          .read<CandidateProfessionalExperiencesBloc>()
                          .add(
                            CandidateProfessionalExperiencesEvent.deleted(
                              id: widget.experience.id,
                            ),
                          ),
                    ),
                    extension:
                        ExperienceExtension(experience: widget.experience),
                  ),
          ),
        ),
      ),
    );
  }
}
