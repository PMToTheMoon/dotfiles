import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/candidate/profile/professional_experiences/professional_experiences.dart';
import 'package:tech_by_tech/candidate/profile/professional_experiences/widgets/professional_experience_card/edit_professional_experience_form.dart';
import 'experience_extension.dart';
import 'experience_header.dart';

class UnfoldableEditableCard extends StatefulWidget {
  const UnfoldableEditableCard({
    super.key,
  });

  final Widget header;
  final Widget extension;
  final Widget editor;
  final VoidCallback onDelete;

  @override
  UnfoldableEditableCardState createState() => UnfoldableEditableCardState();
}

class UnfoldableEditableCardState extends State<UnfoldableEditableCard> {
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
          child: AnimatedCrossFade(
            duration: Feel.durationMedium,
            sizeCurve: Curves.easeInOut,
            crossFadeState:
                _editing ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: EditProfessionalExperienceView(
              experience: widget.experience,
              onCancel: () => setState(() => _editing = false),
              onSuccess: () => setState(() => _editing = false),
            ),
            secondChild: Unfoldable(
              unfolded: unfolded,
              header: ExperienceHeader(
                experience: widget.experience,
                onEdit: () => setState(() {
                  _editing = true;
                }),
                onDelete: () =>
                    context.read<CandidateProfessionalExperiencesBloc>().add(
                          CandidateProfessionalExperiencesEvent.deleted(
                            id: widget.experience.id,
                          ),
                        ),
              ),
              extension: ExperienceExtension(experience: widget.experience),
            ),
          ),
        ),
      ),
    );
  }
}

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
          child: AnimatedCrossFade(
            key: _key,
            duration: Feel.durationMedium,
            sizeCurve: Curves.easeInOut,
            crossFadeState:
                _editing ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: EditProfessionalExperienceView(
              experience: widget.experience,
              onCancel: () => setState(() => _editing = false),
              onSuccess: () => setState(() => _editing = false),
            ),
            secondChild: Unfoldable(
              unfolded: unfolded,
              header: ExperienceHeader(
                experience: widget.experience,
                onEdit: () => setState(() {
                  _editing = true;
                }),
                onDelete: () =>
                    context.read<CandidateProfessionalExperiencesBloc>().add(
                          CandidateProfessionalExperiencesEvent.deleted(
                            id: widget.experience.id,
                          ),
                        ),
              ),
              extension: ExperienceExtension(experience: widget.experience),
            ),
          ),
        ),
      ),
    );
  }
}
