import 'package:bonemeal_config/bonemeal_config.dart';

class BuildPhase {
  final String generatorKey;
  final InputSet generateFor;
  final bool consumeInputs;
  final bool hideOutput;

  const BuildPhase({
    required this.generatorKey,
    required this.generateFor,
    required this.consumeInputs,
    required this.hideOutput,
  });
}
