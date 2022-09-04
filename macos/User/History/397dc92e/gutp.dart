class OutputAsset {
  const OutputAsset({
    required this.path,
    required this.content,
  });
  final String path;
  final String content;
}

abstract class AssetContentBuilder {
  const AssetContentBuilder();
  String build();
}
