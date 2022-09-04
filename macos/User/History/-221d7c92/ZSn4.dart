import 'package:bonemeal/bonemeal.dart';
import 'education.dart';
import 'candidate.dart';
import 'professional_experience.dart';
import 'skill.dart';

class CandidateModels extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return Path('candidate', [
      candidate,
      ProfessionalExperience(),
      NewProfessionalExperience(),
      ProfessionalExperienceUpdate(),
      Education(),
      NewEducation(),
      EducationUpdate(),
      Skill(),
    ]);
  }
}
