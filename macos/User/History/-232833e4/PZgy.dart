part of 'yaml.dart';

class InvalidYamlAsset implements ParseYamlException {}

@freezed
class YamlAsset with _$YamlAsset {
  const factory YamlAsset({
    required String generator,
    required String? version,
    required content<String, dynamic> body,
  }) = _YamlAsset;
}

YamlAsset loadYamlAsset(String yaml) {
  try {
    final maps = loadYamlMaps(yaml);
    if (maps.length != 2) InvalidYamlAsset();
    return YamlAsset(
      generator: maps[0].entries.first.key,
      version: maps[0]['version'],
      content: maps[1],
    );
  } catch (e) {
    throw InvalidYamlAsset();
  }
}
