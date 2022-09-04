import 'dart:async';

import 'package:models/models.dart';
import 'package:tbt_api/tbt_api.dart';
import 'package:tech_by_tech/auth/auth.dart';

/// A repository that provides access to candidates users
class CandidatesRepository {
  CandidatesRepository({
    required AuthRepository authRepository,
  }) : _candidateApi = authRepository.tbtPrivateClient.candidate;

  final CandidateService _candidateApi;

  Future<Candidate> candidate(String id) async {
    return _candidateApi
        .candidate(id)
        .then((r) => r.unwrapOrThrow('exception'));
  }
}
