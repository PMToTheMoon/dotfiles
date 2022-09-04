import 'package:tbt_api/src/tbt_client.dart';
import 'package:tbt_api/tbt_api.dart';
import 'package:test/test.dart';

main() {
  final CandidateService candidate = tbtClient.getService();
  group('Requests', () {
    test('candidate(id)', () {
      candidate.candidate('2903jSMeMNQ88Y0y2mtyIf9SS9W');
    });
  });
}
