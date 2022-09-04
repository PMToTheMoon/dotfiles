import 'package:tbt_api/tbt_api.dart';
import 'package:tech_by_tech/auth/auth.dart';

class CandidateRepository {
  CandidateRepository(AuthRepository authRepository);

  final CandidateService _candidateService;
}
