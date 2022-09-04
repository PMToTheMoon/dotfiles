import 'package:bonemeal/generators/generators.dart';
import 'package:checked_yaml/checked_yaml.dart';
import 'package:yaml/yaml.dart';
export 'models.dart';

class ModelGenerator extends Generator {
  @override
  GeneratorOutput generate(GeneratorInput input) {
    print(loadYaml(input));
    final List<Map<String, dynamic>> models = checkedYamlDecode(
      input,
      (m) => Models.fromJson(m!),
      sourceUrl: Uri.parse("lib/models.yaml"),
    );
    print(models);
    return ClassGenerator().generate("test", {"data": "int"})!;
  }
}
