import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_config/bonemeal_config.dart';

class BuildPhase {
  final String generatorKey;
  final Generator generator;
  final GeneratorOptions generatorOptions;
  final InputSet generateFor;
  final bool consumeInputs;
  final bool hideOutput;

  const BuildPhase({
    required this.generatorKey,
    required this.generator,
    required this.generatorOptions,
    required this.generateFor,
    required this.consumeInputs,
    required this.hideOutput,
  });
}
