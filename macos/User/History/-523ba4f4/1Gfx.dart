import 'dart:convert';

import 'package:bonemeal/generators/generators.dart';
import 'package:checked_yaml/checked_yaml.dart';
import 'package:yaml/yaml.dart';
export 'models.dart';

class ModelGenerator extends Generator {
  @override
  GeneratorOutput generate(GeneratorInput input) {
    final Map<String, dynamic> models = loadYaml(input);
    print(models);
    return ClassGenerator().generate("test", {"data": "int"})!;
  }
}
