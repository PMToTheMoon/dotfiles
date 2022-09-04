import 'package:models/models.dart';

import 'auth_service/json_factories.dart';

final jsonFactories = {
  ...authServiceFactories,
  UserAccount: UserAccount.fromJson,
  Candidate: Candidate.fromJson,
  Skill: Skill.fromJson,
  ProfessionalExperience: ProfessionalExperience.fromJson,
  Education: Education.fromJson,
};
