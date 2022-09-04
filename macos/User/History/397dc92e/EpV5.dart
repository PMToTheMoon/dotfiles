part 'dart_asset_builder.dart';
part 'yaml_asset.dart';

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
