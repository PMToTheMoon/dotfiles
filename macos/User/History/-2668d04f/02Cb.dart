import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_by_tech/candidate/profile/professional_experiences/professional_experiences.dart';

import 'new_professional_experience_card/new_professional_experience_card.dart';
import 'professional_experiences_list_view.dart';

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
            children: const [
              NewProfessionalExperienceCard(),
              CandidateProfessionalExperiencesListView(),
            ],
          ),
        ),
      ),
    );
  }
}
