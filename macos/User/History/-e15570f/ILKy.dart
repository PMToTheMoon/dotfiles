import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/candidate_educations_bloc.dart';
import 'new_professional_experience_card/new_professional_experience_card.dart';
import 'candidate_educations_list_view.dart';

class CandidateEducationsView extends StatelessWidget {
  static CandidateEducationsView builder(BuildContext context) =>
      const CandidateEducationsView();

  const CandidateEducationsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CandidateEducationsBloc(
        candidateRepository: context.read(),
      )..add(const CandidateEducationsEvent.started()),
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 850,
          child: Column(
            children: const [
              NewProfessionalExperienceCard(),
              CandidateEducationsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
