// ignore_for_file: prefer_single_quotes

import 'package:models/models.dart';
import 'package:test/test.dart';

import 'record_json_data.dart';

void main() {
  group('Record from json (getDossier)', () {
    test('sample 1', () {
      Record? record;
      record =
          Record.fromJson(recordSample1['dossier'] as Map<String, dynamic>);
      expect(record, isNot(null));
    });
    test('sample 2', () {
      Record? record;
      record =
          Record.fromJson(recordSample2['dossier'] as Map<String, dynamic>);
      expect(record, isNot(null));
    });
    test('sample 3', () {
      Record? record;
      record =
          Record.fromJson(recordSample3['dossier'] as Map<String, dynamic>);
      expect(record, isNot(null));
    });
  });
  test('sample 4', () {
    Record? record;
    record = Record.fromJson(recordSample4['dossier'] as Map<String, dynamic>);
    expect(record, isNot(null));
  });
  test('sample 5', () {
    Record? record;
    record = Record.fromJson(recordSample5['dossier'] as Map<String, dynamic>);
    expect(record, isNot(null));
  });
  test('sample 6', () {
    Record? record;
    record = Record.fromJson(recordSample6['dossier'] as Map<String, dynamic>);
    expect(record, isNot(null));
  });
}
