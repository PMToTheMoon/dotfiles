import 'dart:async';

import 'package:models/models.dart';
import 'package:tbt_api/tbt_api.dart';
import 'package:tech_by_tech/auth/auth.dart';

class CandidateRepository {
  CandidateRepository({
    required AuthRepository authRepository,
    required this.session,
  }) : _candidateApi = authRepository.tbtPrivateClient.candidate;

  final AuthSession session;

  final CandidateService _candidateApi;

  Future<Candidate> candidate(String id) async {
    final response = await _candidateApi.candidate(session.userId);
    final candidate = response.body;
    if (response.isSuccessful && candidate != null) {
      return candidate;
    } else {
      throw 'Unable to fetch candidate';
    }
  }
}
