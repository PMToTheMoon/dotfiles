import 'dart:math';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tech_by_tech/candidate/profile/professional_experiences/professional_experiences.dart';
import 'professional_experience_card/unfoldable_experience_card.dart';

class CandidateProfessionalExperiencesListView extends StatelessWidget {
  const CandidateProfessionalExperiencesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.select(
      (CandidateProfessionalExperiencesBloc bloc) => bloc.state,
    );
    if (state.isLoading) return const LoadingIndicator();
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
}
