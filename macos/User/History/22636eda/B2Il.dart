import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

import 'package:tech_by_tech/candidate/profile/professional_experiences/professional_experiences.dart';
import 'professional_experience_card/unfoldable_experience_card.dart';

class CandidateProfessionalExperiencesListView extends StatelessWidget {
  const CandidateProfessionalExperiencesListView({
    super.key,
  });

  Widget educationBuilder(
    BuildContext context,
    ProfessionalExperience experience,
    Animation<double> animation,
  ) {
    return UnclippedSizeTransition(
      sizeFactor: animation,
      child: UnfoldableExperienceCard(
        key: ValueKey(experience.id),
        experience: experience,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select(
      (CandidateProfessionalExperiencesBloc bloc) => bloc.state,
    );
    if (state.isLoading) return const LoadingIndicator();
    return DefaultUnfoldableListController(
      child: ImplicitlyAnimatedList(
        clipBehavior: Clip.none,
        shrinkWrap: true,
        items: state.educations,
        insertBuilder: educationBuilder,
        removeBuilder: educationBuilder,
      ),
    );
  }
}
