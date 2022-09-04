import 'package:bonemeal/src/asset/asset_writer.dart';
import 'package:bonemeal/src/io/build_cache_writer.dart';

/// A class responsible for interacting with the outside world
class Environment {
  Environment() : writer = BuildCacheWriter();

  final SyncAssetWriter writer;
}
