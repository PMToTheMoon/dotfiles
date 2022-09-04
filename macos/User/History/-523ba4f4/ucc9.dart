import 'package:bonemeal/generators/generators.dart';
export 'models.dart';

class ModelGenerator extends Generator {
  @override
  GeneratorOutput generate(GeneratorInput input) {
    return ClassGenerator().generate("test", {"data": "int"})!;
  }
}
