import 'dart:io';

import 'package:yaml/yaml.dart';

extension YamlMapConverter on YamlMap {
  dynamic _convertNode(dynamic node) {
    if (node is YamlMap) {
      return node.toMap();
    } else if (node is YamlList) {
      return node.map(_convertNode).toList();
    } else {
      return node;
    }
  }

  Map<String, dynamic> toMap() {
    return nodes.map((k, v) => MapEntry(
          (k as YamlScalar).value.toString(),
          _convertNode(v.value),
        ));
  }
}

class InvalidFile implements Exception {
  InvalidFile(String path) : super(path);
}

Future<Map<String, dynamic>> mapFromYamlFile(String path) async {
  final file = File('../test/api.yaml');
  if (!await file.exists()) {
    throw InvalidFile()
  }
  final yaml = (loadYaml(await file.readAsString()) as YamlMap).toMap();
}
