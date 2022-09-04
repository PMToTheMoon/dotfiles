import 'dart:io';
import 'dart:convert';
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
  final data = json.decode(loadYaml(await file.readAsString()));

  print(data.runtimeType);

  if (data is Map<String, dynamic>) {
    for (final e in data.entries) {
      final out = ClassGen().generate(e.key, e.value);
      if (out == null) continue;
      generatedClasses.add(out);
    }
  }

  context.vars["generatedClasses"] = generatedClasses.join('\n');
}
