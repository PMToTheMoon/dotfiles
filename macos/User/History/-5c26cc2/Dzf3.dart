import 'dart:async';

import 'package:models/models.dart';
import 'package:tbt_api/tbt_api.dart';
import 'package:tech_by_tech/auth/auth.dart';

class CandidateRepository {
  CandidateRepository({
    required AuthRepository authRepository,
  }) : _candidateApi = authRepository.tbtPrivateClient.candidate;

  final CandidateService _candidateApi;

  Future<UserAccount> candidate(String id) async {
    return _candidateApi
        .candidate(id)
        .then((r) => r.unwrapOrThrow('exception'));
  }
}
