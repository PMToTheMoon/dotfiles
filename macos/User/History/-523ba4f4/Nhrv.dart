import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal/utils/yaml.dart';
import 'package:checked_yaml/checked_yaml.dart';
import 'package:yaml/yaml.dart';

class ModelGenerator extends Generator {
  @override
  GeneratorOutput generate(GeneratorInput input) {
    // final Map<String, dynamic> models = checkedYamlDecode<Map<String, dynamic>>(
    //   input,
    //   (m) => Models.fromJson(m!),
    //   sourceUrl: Uri.parse("lib/models.yaml"),
    // );
    final models = loadYamlMap(input);
    print(models);
    return ClassGenerator().generate("test", {"data": "int"})!;
  }
}
