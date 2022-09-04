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

  if (data is Map<String, dynamic>) {
    for (final e in data.entries) {
      final out = ClassGen().generate(e.key, e.value);
      if (out == null) continue;
      generatedClasses.add(out);
    }
  }

  print(ClassGen().generate(name, data));
}
