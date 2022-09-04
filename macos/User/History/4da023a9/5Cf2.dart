import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_config/bonemeal_config.dart';

class BuildPhase {
  final String GeneratorKey;
  final Generator generator;
  final GeneratorOptions options;
  final InputSet generateFor;
  final bool consumeInputs;
  final bool hideOutput;

  const BuildPhase({
    required this.GeneratorKey,
    required this.generator,
    required this.options,
    required this.generateFor,
    required this.consumeInputs,
    required this.hideOutput,
  });
}
