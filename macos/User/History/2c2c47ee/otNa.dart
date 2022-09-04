import 'package:bonemeal/bonemeal.dart';
import 'package:bloc_generators/bloc_generators.dart';

import 'profile/user_details/professional_experiences/professionnal_experiences.dart';
import 'profile/user_details/professional_experiences/training.dart';

class CandidateFeature extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return Path('candidate/profile/', [
      Path('professional_experiences/', [
        Path('widgets/professional_experience_form/', [
          ProfessionalExperiencesForm(),
        ]),
      ]),
      Path('educations/', [
        Path('widgets/education_form/', [
          EducationForm(),
        ]),
      ]),
      // Path('skills', [
      //   Path('skill_list', [
      //     TripleStateBloc(
      //       subject: 'CandidateSkillList',
      //       source: RepositoryFutureSourceImpl(
      //         refer(
      //           'CandidateRepository',
      //           'package:tech_by_tech/candidate/candidate.dart',
      //         ),
      //         Method(
      //           (m) => m
      //             ..name = 'fetchSkillList'
      //             ..returns = refer(
      //               'void',
      //               'package:models/models.dart',
      //             ),
      //         ),
      //       ),
      //     ),
      //   ]),
      //   Path('update_skills', [
      //     TripleStateBloc(
      //       subject: 'CandidateUpdateSkills',
      //       source: RepositoryFutureSourceImpl(
      //         refer(
      //           'CandidateRepository',
      //           'package:tech_by_tech/candidate/candidate.dart',
      //         ),
      //         Method(
      //           (m) => m
      //             ..name = 'updateSkillList'
      //             ..returns = refer(
      //               'void',
      //               'package:models/models.dart',
      //             ),
      //         ),
      //       ),
      //     ),
      //   ])
      // ])
      //Don't use
      // Path('new_professional_experience_card/', [
      //   TripleStateBloc(
      //     subject: 'CandidateNewProfessionalExperience',
      //     source: RepositoryFutureSourceImpl(
      //       refer(
      //         'CandidateRepository',
      //         'package:tech_by_tech/candidate/candidate.dart',
      //       ),
      //       Method(
      //         (m) => m
      //           ..name = 'createProfessionalExperiences'
      //           ..returns = refer(
      //             'void',
      //             'package:models/models.dart',
      //           ),
      //       ),
      //     ),
      //   ),
      // ]),
    ]);
  }
}
