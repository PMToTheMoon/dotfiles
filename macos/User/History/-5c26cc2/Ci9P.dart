import 'dart:async';

import 'package:models/models.dart';
import 'package:tbt_api/tbt_api.dart';
import 'package:tech_by_tech/auth/auth.dart';

class UserCandidateRepository {
  UserCandidateRepository({required AuthRepository authRepository})
      : _candidateApi = authRepository.tbtPrivateClient.candidate;

  final CandidateService _candidateApi;

  final _candidateStream = StreamController<Candidate>.broadcast();

  Candidate? _candidate;
  Candidate? get candidate => _candidate;
  Stream<Candidate> get candidateStream => _candidateStream.stream;

  Future<void> fetchCurrentCandidate(String id) {
    return _candidateApi.candidate(id);
  }
}
