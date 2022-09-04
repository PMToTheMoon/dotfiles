import 'package:models/models.dart';
import 'package:tbt_api/tbt_api.dart';
import 'package:test/test.dart';

main() {
  final client = TbtPublicClient();
  final auth = client.auth;
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
