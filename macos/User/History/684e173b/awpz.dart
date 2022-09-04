import 'package:bonemeal_gen/bonemeal_gen.dart';
import 'package:test/test.dart';

final registry = Map<Type, String>;

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });
}
