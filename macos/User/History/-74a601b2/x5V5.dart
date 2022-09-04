import 'dart:io';
import 'package:yaml/yaml.dart';

extension YamlMapConverter on YamlMap {
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

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    nodes.forEach((k, v) {
      map[(k as YamlScalar).value.toString()] = _convertNode(v.value);
    });
    return map;
  }
}

Future<void> main(List<String> arguments) async {
  final file = File('../api.yaml');
  if (!await file.exists()) {
    return;
  }
  final data = loadYaml(await file.readAsString()).toMap();
  print(data);
}
