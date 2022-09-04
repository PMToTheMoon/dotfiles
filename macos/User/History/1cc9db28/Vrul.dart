import 'package:bonemeal/bonemeal.dart';

/// An [AssetReader] that can provide actual paths to assets on disk.
abstract class PathProvidingAssetReader implements AssetReader {
  String pathTo(AssetId id);
}
