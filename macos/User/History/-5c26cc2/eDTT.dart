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

  Future<Candidate> candidate(String id) async {
    final response = await _candidateApi.candidate(auth.userId);
    final candidate = response.body;
    if (response.isSuccessful && candidate != null) {
      return candidate;
    } else {
      throw 'Unable to fetch candidate';
    }
  }
}
