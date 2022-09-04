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

/// Parse input yaml string and return the constructed Map<String, dynamic>
Map<String, dynamic> loadYamlMap(String yaml) {
  try {
    return (loadYaml(yaml) as YamlMap).toMap();
  } catch (e) {
    throw InvalidYamlMap();
  }
}
