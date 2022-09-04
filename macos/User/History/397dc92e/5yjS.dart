class Asset {
  const Asset({
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
