import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal/utils/yaml.dart';
import 'package:checked_yaml/checked_yaml.dart';
import 'package:yaml/yaml.dart';

class ModelGenerator extends Generator {
  @override
  GeneratorOutput generate(GeneratorInput input) {
    final List<String> models = checkedYamlDecode<Map<String, dynamic>>(
      input,
      (m) => m.map(
        (key, value) => ClassGenerator().generate("test", {"data": "int"}),
      ),
      sourceUrl: Uri.parse("lib/models.yaml"),
    );
    final models = loadYamlMap(input);
    print(models);
    return ClassGenerator().generate("test", {"data": "int"});
  }
}
