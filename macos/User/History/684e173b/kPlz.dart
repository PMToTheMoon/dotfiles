import 'package:bonemeal_gen/bonemeal_gen.dart';
import 'package:test/test.dart';

import 'to_import.dart';
import 'registry.dart';

void main() {
  test('calculate', () {
    expect(registry[String], "String");
    expect(registry[double], "Double");
  });
}
