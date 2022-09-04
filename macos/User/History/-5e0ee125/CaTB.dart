import 'package:bonemeal/asset/asset.dart';

class BuildSources {
  BuildSources({required this.assets});
  final Map<String, Asset> assets;

  YamlAsset yamlAsset(String path) => assets[path] as YamlAsset;
}
