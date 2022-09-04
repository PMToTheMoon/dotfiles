import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tech_by_tech/candidate/profile/professional_experiences/professional_experiences.dart';
import 'professional_experience_card/unfoldable_experience_card.dart';

class CandidateProfessionalExperiencesListView extends StatefulWidget {
  const CandidateProfessionalExperiencesListView({
    super.key,
  });

  @override
  State<CandidateProfessionalExperiencesListView> createState() =>
      _CandidateProfessionalExperiencesListViewState();
}

class _CandidateProfessionalExperiencesListViewState
    extends State<CandidateProfessionalExperiencesListView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final experiences = context.select(
      (CandidateProfessionalExperiencesBloc bloc) => bloc.state.experiences,
    );
    return DefaultUnfoldableListController(
      child: Column(
        children: experiences
            .map((experience) => UnfoldableExperienceCard(
                  key: ValueKey(experience.id),
                  experience: experience,
                ))
            .toList(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
