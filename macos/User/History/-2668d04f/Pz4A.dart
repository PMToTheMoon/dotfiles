import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/candidate_professional_experiences_bloc.dart';
import '../widgets/new_professional_experience_card.dart';
import '../widgets/unfoldable_experience_card.dart';

class CandidateProfessionalExperiencesView extends StatelessWidget {
  static CandidateProfessionalExperiencesView builder(BuildContext context) =>
      const CandidateProfessionalExperiencesView();

  const CandidateProfessionalExperiencesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CandidateProfessionalExperiencesBloc(
        candidateRepository: context.read(),
      )..add(const CandidateProfessionalExperiencesEvent.started()),
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 850,
          child: Column(
            children: [
              const NewProfessionalExperienceCard(),
              BlocConsumer<CandidateProfessionalExperiencesBloc,
                  CandidateProfessionalExperiencesState>(
                listener: (c, s) {
                  print("changed");
                },
                builder: (context, state) {
                  if (state.isLoading) return const LoadingIndicator();
                  return DefaultUnfoldableListController(
                    child: Column(
                      children: state.experiences
                          .map((experience) => UnfoldableExperienceCard(
                                experience: experience,
                              ))
                          .toList(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
