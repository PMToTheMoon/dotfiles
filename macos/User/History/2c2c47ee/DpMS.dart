import 'package:bonemeal/bonemeal.dart';
import 'package:bloc_generators/bloc_generators.dart';

import 'profile/user_details/professional_experiences/professionnal_experiences.dart';

class CandidateFeature extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return Path('candidate/profile/professional_experiences/', [
      Path('widgets/professional_experience_form/', [
        ProfessionalExperiencesForm(),
      ]),
      Path('bloc/list', [
        TripleStateBloc(
          subject: 'CandidateProfessionalExperiences',
          source: RepositoryFutureSourceImpl(
            refer('CandidateRepository',
                'package:tech_by_tech/candidate/candidate.dart'),
            Method(
              (m) => m
                ..name = 'fetchProfessionalExperiences'
                ..returns = refer(
                  'List<ProfessionalExperience>',
                  'package:models/models.dart',
                ),
            ),
          ),
        ),
      ]),
      Path('bloc/create', [
        TripleStateBloc(
          subject: 'CandidateProfessionalExperiences',
          source: RepositoryFutureSourceImpl(
            refer('CandidateRepository',
                'package:tech_by_tech/candidate/candidate.dart'),
            Method(
              (m) => m
                ..name = 'fetchProfessionalExperiences'
                ..returns = refer(
                  'List<ProfessionalExperience>',
                  'package:models/models.dart',
                ),
            ),
          ),
        ),
      ])
    ]);
  }
}
