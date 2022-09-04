import 'package:bonemeal/bonemeal.dart';
import 'background.dart';
import 'candidate.dart';
import 'professional_experience.dart';

class CandidateModels extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return Path('candidate', [
      candidate,
      ProfessionalExperience(),
      NewProfessionalExperience(),
      ProfessionalExperienceUpdate(),
      Background(),
    ]);
  }
}
