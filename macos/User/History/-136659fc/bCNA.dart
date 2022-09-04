import 'dart:io';
import 'package:mason/mason.dart';
import 'package:ftool/ftool.dart';
import 'package:yaml/yaml.dart';

Future<void> run(HookContext context) async {
  context.logger.info('api post-gen hook started');
  List<String> generatedClasses = [];

  final file = File('{{input}}');
  if (!await file.exists()) {
    context.logger.err("API: input file not found");
    return;
  }
  final data = loadYaml(await file.readAsString());
  if (data is Map<String, dynamic>) {
    for (final e in data.entries) {
      final out = ClassGen().generate(e.key, e.value);
      if (out == null) continue;
      generatedClasses.add(out);
    }
  }

  print("ttets");

  context.vars["generatedClasses"] = generatedClasses.join('\n');
}
