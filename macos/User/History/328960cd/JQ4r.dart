import 'package:bonemeal_runner/bonemeal_runner.dart' as _i1;
import 'package:test_generator/test_generator.dart' as _i2;
import 'package:bonemeal_config/bonemeal_config.dart' as _i3;
import 'package:bonemeal/bonemeal.dart' as _i4;
import 'dart:isolate' as _i5;
import 'dart:io' as _i6;

final _generators = <_i1.GeneratorApplication>[
  _i1.apply(r'test_generator:test_generator', [_i2.testGenerator],
      consumeInputs: true,
      hideOutputs: true,
      defaultGenerateFor: const _i3.InputSet(include: [r'**.dart']),
      defaultOptions:
          const _i4.GeneratorOptions(<String, dynamic>{r'test': true}))
];
void main(List<String> args, [_i5.SendPort sendPort]) async {
  var result = await _i1.run(args, _generators);
  sendPort?.send(result);
  _i6.exitCode = result;
}
