import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/candidate/profile/professional_experiences/bloc/candidate_professional_experiences_bloc.dart';
import 'candidate_professional_experiences_consumer.dart';
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
              CandidateProfessionalExperiencesBlocConsumer(
                loading: (c, s) => const LoadingIndicator(),
                error: (c, s) => const ErrorIndicator(),
                success: (c, s) => DefaultUnfoldableListController(
                  child: Column(
                    children: s.data
                        .map((experience) => UnfoldableExperienceCard(
                              experience: experience,
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
