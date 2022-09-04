import 'package:tbt_api/tbt_api.dart';
import 'package:tech_by_tech/auth/auth.dart';

class CandidateRepository {
  CandidateRepository(AuthRepository authRepository)
      : _candidateApi = authRepository.tbtPrivateClient.candidate;

  final CandidateService _candidateApi;
}
