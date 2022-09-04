import 'package:models/models.dart';
import 'package:tbt_api/src/tbt_client.dart';
import 'package:tbt_api/tbt_api.dart';
import 'package:test/test.dart';

main() {
  final CandidateService candidate = tbtClient.getService();
  group('Requests', () {
    test('candidate(id)', () async {
      final mock = Candidate(
        id: '2903jSMeMNQ88Y0y2mtyIf9SS9W',
        firstName: 'Miles',
        lastName: 'Davis',
        biography: 'A legendary trumpet player',
      );
      final response = await candidate.candidate('2903jSMeMNQ88Y0y2mtyIf9SS9W');
      expect(response, isNotNull);
    });
  });
}
