import 'dart:math';

import 'package:models/models.dart';
import 'package:tbt_api/src/candidate_service/candidate_service.dart';
import 'package:tbt_api/src/tbt_public_client.dart';
import 'package:tbt_api/tbt_api.dart';
import 'package:test/test.dart';

import 'utils.dart';

main() {
  final client = TbtPrivateClient(MockAuthProvider());
  final CandidateService candidate = client.candidate;
  group('Candidate service test', () {
    test('candidate(id)', () async {
      const expectedCandidate = Candidate(
        id: '2903jSMeMNQ88Y0y2mtyIf9SS9W',
        firstName: 'Miles',
        lastName: 'Davis',
        biography: 'A legendary trumpet player',
      );
      final response = await candidate.candidate(expectedCandidate.id);
      expect(response.isSuccessful, true);
      expect(response.body, isNotNull);
      expect(response.body?.id, expectedCandidate.id);
    });
  });
}
