import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

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
            firstChild: EditEducationView(
              experience: widget.experience,
              onCancel: () => setState(() => _editing = false),
              onSuccess: () => setState(() => _editing = false),
            ),
            secondChild: Unfoldable(
              unfolded: unfolded,
              header: EducationHeader(
                experience: widget.experience,
                onEdit: () => setState(() {
                  _editing = true;
                }),
                onDelete: () => context.read<CandidateEducationsBloc>().add(
                      CandidateEducationsEvent.deleted(
                        id: widget.experience.id,
                      ),
                    ),
              ),
              extension: EducationExtension(experience: widget.experience),
            ),
          ),
        ),
      ),
    );
  }
}
