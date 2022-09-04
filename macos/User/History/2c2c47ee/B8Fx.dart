import 'package:bonemeal/bonemeal.dart';

import 'profile/user_details/professional_experiences/professionnal_experiences.dart';

class CandidateFeature extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return Path('candidate/profile/professional_experiences/widgets', [
      ProfessionalExperiencesForm(),
    ]);
  }
}
