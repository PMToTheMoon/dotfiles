import 'package:bonemeal_core/asset/asset.dart';

class BuildAssets {
  BuildAssets({required this.assets});
  final Map<String, Asset> assets;

  YamlAsset yamlAsset(String path) => assets[path] as YamlAsset;
}
