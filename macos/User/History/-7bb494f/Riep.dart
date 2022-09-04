import 'package:models/models.dart';
import 'package:tbt_api/tbt_api.dart';
import 'package:test/test.dart';

import 'utils.dart';

main() {
  final client = TbtPrivateClient(MockAuthProvider());
  final UserService candidate = client.user;
  group('User service test', () {
    test('user(id)', () async {
      const expectedCandidate = User(
        id: '2CW568J0yLKXns8w9vLFeagVSX1',
      );
      final response = await candidate.candidate(expectedCandidate.id);
      expect(response.isSuccessful, true);
      expect(response.body, isNotNull);
      expect(response.body?.id, expectedCandidate.id);
    });
  });
}
