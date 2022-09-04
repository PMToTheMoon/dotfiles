import 'package:bonemeal/bonemeal.dart';
import 'professional_experience.dart';

class CandidateModel extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return Path('candidate', [
      CandidateModel(),
      ProfessionalExperience(),
    ]);
  }
}
