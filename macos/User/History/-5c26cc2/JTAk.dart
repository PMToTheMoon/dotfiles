import 'dart:async';

import 'package:models/models.dart';
import 'package:tbt_api/tbt_api.dart';
import 'package:tech_by_tech/auth/auth.dart';

class UserCandidateRepository {
  UserCandidateRepository({
    required AuthRepository authRepository,
    required this.auth,
  }) : _candidateApi = authRepository.tbtPrivateClient.candidate;

  final AuthStatusAuthenticated auth;

  final CandidateService _candidateApi;

  final _candidateStreamController = StreamController<Candidate>.broadcast();

  Candidate? _candidate;
  Candidate? get candidate => _candidate;
  Stream<Candidate> get candidateStream => _candidateStreamController.stream;

  Future<Candidate> fetch() async {
    final response = await _candidateApi.candidate(auth.userId);
    final candidate = response.body;
    if (response.isSuccessful && candidate != null) {
      _candidate = candidate;
      _candidateStreamController.add(candidate);
      return candidate;
    } else {
      throw 'Unable to fetch candidate';
    }
  }
}
