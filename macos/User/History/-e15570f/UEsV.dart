import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/candidate_educations_bloc.dart';
import 'candidate_educations_list_view.dart';
import 'new_education_card/new_education_card.dart';

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
          child: BlocBuilder<C=andidateEducationsBloc, CandidateEducationsState>(
                buildWhen: (previous, current) =>
                    previous.isLoading != current.isLoading ||
                    previous.educations.length != current.educations.length,
                builder: (c, state) => 
              
             Column(
              children: [
                const NewEducationCard(),
                CandidateEducationsListView(
                  isLoading: state.isLoading,
                  educations: state.educations,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
