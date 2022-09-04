import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/candidate/profile/educations/bloc/candidate_educations_bloc.dart';

import 'education_card/unfoldable_education_card.dart';

class CandidateEducationsListView extends StatelessWidget {
  const CandidateEducationsListView({
    super.key,
  });

  Widget educationBuilder(
      BuildContext context, Education education, Animation<double> animation) {
    return UnclippedSizeTransition(
      sizeFactor: animation,
      child: UnfoldableEducationCard(
        key: ValueKey(education.id),
        education: education,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((CandidateEducationsBloc bloc) => bloc.state);
    if (state.isLoading) return const LoadingIndicator();
    return DefaultUnfoldableListController(
      child: ImplicitlyAnimatedList<Education>(
        clipBehavior: Clip.none,
        shrinkWrap: true,
        items: state.educations,
        insertBuilder: educationBuilder,
        removeBuilder: educationBuilder,
      ),
    );
  }
}
