import 'package:bonemeal_gen/bonemeal_gen.dart';
import 'package:test/test.dart';

class Registry {
  final items = Map<Type, String>;
}

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });
}
