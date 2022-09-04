import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/candidate/profile/educations/bloc/candidate_educations_bloc.dart';

import 'edit_education_form.dart';
import 'education_extension.dart';
import 'education_header.dart';

class UnfoldableEducationCard extends StatefulWidget {
  const UnfoldableEducationCard({
    required this.education,
    required this.inOutAnimation,
    super.key,
  });

  final Education education;
  final Animation<double> inOutAnimation;

  @override
  State<UnfoldableEducationCard> createState() =>
      _UnfoldableEducationCardState();
}

class _UnfoldableEducationCardState extends State<UnfoldableEducationCard> {
  bool _editing = false;
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: widget.inOutAnimation,
      child: UnfoldableListItem(
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
              crossFadeState: _editing
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: EditEducationView(
                education: widget.education,
                onCancel: () => setState(() => _editing = false),
                onSuccess: () => setState(() => _editing = false),
              ),
              secondChild: Unfoldable(
                unfolded: unfolded,
                header: EducationHeader(
                  education: widget.education,
                  onEdit: () => setState(() {
                    _editing = true;
                  }),
                  onDelete: () => context.read<CandidateEducationsBloc>().add(
                        CandidateEducationsEvent.deleted(
                          id: widget.education.id,
                        ),
                      ),
                ),
                extension: EducationExtension(education: widget.education),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
