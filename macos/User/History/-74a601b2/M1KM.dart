import 'dart:io';
import 'package:yaml/yaml.dart';

import 'type/type.dart';
import 'yaml/yaml.dart';

Future<void> main(List<String> arguments) async {
  final file = File('../test/api.yaml');
  if (!await file.exists()) {
    return;
  }
  final YamlMap data = loadYaml(await file.readAsString());
  final d = data.toMap();
  print(ClassGen().generate(name, data));
}
