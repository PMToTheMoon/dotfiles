import 'dart:io';
import 'dart:convert';
import 'package:mason/mason.dart';
import 'package:ftool/ftool.dart';
import 'package:yaml/yaml.dart';

extension YamlMapConverter on YamlMap {
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    nodes.forEach((k, v) {
      map[(k as YamlScalar).value.toString()] = _convertNode(v.value);
    });
    return map;
  }

  dynamic _convertNode(dynamic v) {
    if (v is YamlMap) {
      return (v as YamlMap).toMap();
    } else if (v is YamlList) {
      var list = <dynamic>[];
      v.forEach((e) {
        list.add(_convertNode(e));
      });
      return list;
    } else {
      return v;
    }
  }
}

Future<void> run(HookContext context) async {
  context.logger.info('api post-gen hook started');
  List<String> generatedClasses = [];

  final file = File('{{input}}');
  if (!await file.exists()) {
    context.logger.err("API: input file not found");
    return;
  }
  final data = loadYaml(await file.readAsString()).toMap();

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
