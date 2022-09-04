import 'package:bonemeal/src/asset/asset_writer.dart';

import 'build_cache.dart';

/// A class responsible for interacting with the outside world
class IOEnvironment {
  IOEnvironment() : _cache = BuildCache() {
    // _initialize
  }

  final BuildCache _cache;

  SyncAssetWriter get writer => _cache;
}
