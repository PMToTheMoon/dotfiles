part of 'yaml.dart';

@freezed
class YamlAsset with _$YamlAsset {
  const factory YamlAsset({
    required String generator,
    required String version,
    required Map<String, dynamic> body,
  }) = _YamlAsset;
}

YamlAsset loadYamlAsset(String yaml) {
  try {
    final maps = loadYamlMaps(yaml);
  } catch (e) {
    throw InvalidYamlMap();
  }
}
