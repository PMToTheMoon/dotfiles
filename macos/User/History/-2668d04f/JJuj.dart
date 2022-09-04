import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'views/experience_list_view.dart';
import 'widgets/new_professional_experience_card.dart';

import 'widgets/unfoldable_experience_card.dart';

final experience = ProfessionalExperience(
  id: 'id',
  title: "Junior Front End Developper",
  company: "Decathlon",
  location: "Saint-Denis, Ile de France",
  beginDate: DateTime(1900),
);

class CandidateProfessionalExperiences extends StatelessWidget {
  static CandidateProfessionalExperiences builder(BuildContext context) =>
      const CandidateProfessionalExperiences();

  const CandidateProfessionalExperiences({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
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
    );
  }
}
