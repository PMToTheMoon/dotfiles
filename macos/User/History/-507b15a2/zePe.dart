// ignore_for_file: prefer_single_quotes

import 'package:models/models.dart';
import 'package:test/test.dart';

void main() {
  group('Record from json (getDossier)', body)
  test('Record from json', () {
    Record? record;
    record = Record.fromJson(recordJson['dossier'] as Map<String, dynamic>);
    expect(record, isNot(null));
  });
}
