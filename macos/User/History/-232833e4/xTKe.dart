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
    return loadYamlDocuments(yaml)
        .map((doc) => _convertNode(doc.contents) as Map<String, dynamic>)
        .toList();
  } catch (e) {
    throw InvalidYamlMap();
  }
}
