part of 'yaml.dart';

class InvalidYamlAsset implements ParseYamlException {}

YamlAsset loadYamlAsset(String yaml) {
  try {
    final maps = loadYamlMaps(yaml);
    if (maps.length != 2) InvalidYamlAsset();
    return YamlAsset(
      generator: maps[0].entries.first.key,
      version: maps[0]['version'],
      body: maps[1],
    );
  } catch (e) {
    throw InvalidYamlAsset();
  }
}
