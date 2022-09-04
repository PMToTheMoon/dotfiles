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
