import 'dart:html';

import 'package:models/models.dart';
import 'package:tbt_api/tbt_api.dart';
import 'package:test/test.dart';

main() {
  final client = TbtPublicClient();
  final auth = client.auth;
  group('Candidate service test', () {
    test('candidate(id)', () async {
      const credentials = LoginRequest(
        email: 'teddymeng@gmail.com',
        password: 'P@ssword123456',
      );
      final response = await candidate.candidate(expectedCandidate.id);
      expect(response.isSuccessful, true);
      expect(response.body, isNotNull);
      expect(response.body?.id, expectedCandidate.id);
    });
  });
}
