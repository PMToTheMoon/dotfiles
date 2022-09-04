part of 'asset.dart';

class YamlAsset extends Asset {
  const YamlAsset({
    required super.path,
    required super.content,
    required String generator,
    required String? version,
    required Map<String, dynamic> body,
  });
}
