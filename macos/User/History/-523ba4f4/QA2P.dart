import 'package:bonemeal/generators/generators.dart';
import 'package:checked_yaml/checked_yaml.dart';
export 'models.dart';

class ModelGenerator extends Generator {
  @override
  GeneratorOutput generate(GeneratorInput input) {
    final models = checkedYamlDecode(
      input,
      (m) => Models.fromJson(m!),
    );
    return ClassGenerator().generate("test", {"data": "int"})!;
  }
}
