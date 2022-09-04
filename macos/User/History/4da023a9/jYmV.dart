import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_config/bonemeal_config.dart';

class BuildPhase {
  String GeneratorKey;
  Generator generator;
  GeneratorOptions options;
  InputSet generateFor;
  bool consumeInputs;
  bool hideOutput;
}
