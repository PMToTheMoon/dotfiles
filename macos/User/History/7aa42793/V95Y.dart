import 'package:yaml/yaml.dart';
import 'package:bonemeal_core/asset/asset.dart';

part 'yaml_asset.dart';

class ParseYamlException implements Exception {}

class InvalidYamlMap implements ParseYamlException {}

class InvalidYamlList implements ParseYamlException {}

dynamic _convertNode(dynamic node) {
  if (node is YamlMap) {
    return node.toMap();
  } else if (node is YamlList) {
    return node.map(_convertNode).toList();
  } else {
    return node;
  }
}

extension YamlMapConverter on YamlMap {
  Map<String, dynamic> toMap() {
    return nodes.map((k, v) => MapEntry(
          (k as YamlScalar).value.toString(),
          _convertNode(v.value),
        ));
  }
}

/// Parse input yaml string and return the constructed Map<String, dynamic>
///
/// throw an [InvalidYamlMap] exception if yaml input ins't valid
/// or if the root of the yaml isn't a map
Map<String, dynamic> loadYamlMap(String yaml) {
  try {
    return (loadYaml(yaml) as YamlMap).toMap();
  } catch (e) {
    throw InvalidYamlMap();
  }
}

List<Map<String, dynamic>> loadYamlMaps(String yaml) {
  try {
    return loadYamlDocuments(yaml)
        .map((doc) => _convertNode(doc.contents) as Map<String, dynamic>)
        .toList();
  } catch (e) {
    throw InvalidYamlMap();
  }
}

class InvalidYamlAsset implements ParseYamlException {}

YamlWithHeader loadYamlWithHeader(String yaml) {
  try {
    final maps = loadYamlMaps(yaml);
    if (maps.length != 2) InvalidYamlAsset();
    return YamlWithHeader(
      header: YamlHeader(
        generator: maps[0].entries.first.key,
        version: maps[0]['version'],
      ),
      body: maps[1],
    );
  } catch (e) {
    throw InvalidYamlAsset();
  }
}
