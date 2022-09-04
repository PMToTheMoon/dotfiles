import 'package:bonemeal/asset/asset.dart';

class BuildSources {
  BuildSources({required this.sources});
  final Map<String, Asset> assets;
  final Map<String, YamlAsset> yamlAssets;
}
