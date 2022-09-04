import 'package:bonemeal/bonemeal.dart';
import 'package:yaml/yaml.dart';

class ModelGenerator extends Generator {
  @override
  GeneratorOutput generate(GeneratorInput input) {
    // final Map<String, dynamic> models = checkedYamlDecode<Map<String, dynamic>>(
    //   input,
    //   (m) => Models.fromJson(m!),
    //   sourceUrl: Uri.parse("lib/models.yaml"),
    // );
    final Map<String, dynamic> models = loadYaml(input).t;
    print(models);
    return ClassGenerator().generate("test", {"data": "int"})!;
  }
}
