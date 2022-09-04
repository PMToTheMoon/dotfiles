import 'package:bonemeal/bonemeal.dart';

class ModelGenerator extends Generator {
  @override
  GeneratorOutput generate(GeneratorInput input) {
    return loadYamlMap(input)
        .entries
        .map((e) => ModelGenerator().generate(e.key, e.value))
        .join("\n");
  }
}
