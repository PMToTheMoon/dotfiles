@freezed
class YamlAsset with _$YamlAsset {
  const factory YamlAsset({
    required String generator,
    required String? version,
    required Map<String, dynamic> body,
  }) = _YamlAsset;
}
