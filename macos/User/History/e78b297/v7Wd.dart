import 'package:yaml/yaml.dart';

class ParseYamlException implements Exception {}

class InvalidYamlMap implements ParseYamlException {}

class InvalidYamlList implements ParseYamlException {}

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

Map<String, dynamic> loadYamlMap(String source) {
  try {
    (loadYaml(input) as YamlMap).toMap();
  } catch (e) {
    throw InvalidYamlMap();
  }
}
