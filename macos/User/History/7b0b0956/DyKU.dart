// ignore_for_file: directives_ordering
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bonemeal_runner/bonemeal_runner.dart' as _i1;
import 'package:test_generator/test_generator.dart' as _i2;
import 'dart:isolate' as _i3;
import 'dart:io' as _i4;

final _generators = <_i1.GeneratorApplication>[
  _i1.apply(r'test_generator:test_generator', [_i2.testGenerator],
      _i1.toDependentsOf(r'test_generator'))
];
void main(List<String> args, [_i3.SendPort? sendPort]) async {
  var result = await _i1.run(args, _generators);
  sendPort?.send(result);
  _i4.exitCode = result;
}
