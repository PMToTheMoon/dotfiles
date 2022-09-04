import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/candidate_professional_experiences_bloc.dart';
import 'new_professional_experience_card/new_professional_experience_card.dart';
import 'professional_experiences_list_view.dart';

class CandidateProfessionalExperiencesView extends StatefulWidget {
  static CandidateProfessionalExperiencesView builder(BuildContext context) =>
      const CandidateProfessionalExperiencesView();

  const CandidateProfessionalExperiencesView({
    super.key,
  });

  @override
  State<CandidateProfessionalExperiencesView> createState() =>
      _CandidateProfessionalExperiencesViewState();
}

class _CandidateProfessionalExperiencesViewState
    extends State<CandidateProfessionalExperiencesView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
