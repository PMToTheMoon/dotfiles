import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_by_tech/candidate/profile/professional_experiences/bloc/candidate_professional_experiences_bloc.dart';

import 'unfoldable_experience_card.dart';

class CandidateProfessionalExperiencesListView extends StatelessWidget {
  const CandidateProfessionalExperiencesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final experiences = context.select(
      (CandidateProfessionalExperiencesBloc bloc) => bloc.state.experiences,
    );
    return DefaultUnfoldableListController(
      child: Column(
        children: experiences
            .map((experience) => UnfoldableExperienceCard(
                  experience: experience,
                ))
            .toList(),
      ),
    );
  }
}
