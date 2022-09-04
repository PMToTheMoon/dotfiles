import 'dart:io';
import 'package:yaml/yaml.dart';

import 'type/type.dart';
import 'yaml/yaml.dart';

Future<void> main(List<String> arguments) async {
  final file = File('../test/api.yaml');
  if (!await file.exists()) {
    return;
  }
  final data = (loadYaml(await file.readAsString()) as YamlMap).toMap();

  for (final e in data.entries) {
    final out = ClassGen().generate(e.key, e.value);
    if (out == null) continue;
    print(out);
    print("");
  }
}
