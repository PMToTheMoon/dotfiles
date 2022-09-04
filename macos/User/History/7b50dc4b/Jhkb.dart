import 'package:models/models.dart';
import 'package:tbt_api/tbt_api.dart';
import 'package:test/test.dart';

import 'utils.dart';

main() {
  final client = TbtPrivateClient(MockAuthProvider());
  final CandidateService candidate = client.candidate;
  group('Candidate service test', () {
    test('candidate(id)', () async {
      final response = await candidate.candidate(expectedCandidate.id);
      expect(response.isSuccessful, true);
      expect(response.body, isNotNull);
      expect(response.body?.id, expectedCandidate.id);
    });
  });
}
