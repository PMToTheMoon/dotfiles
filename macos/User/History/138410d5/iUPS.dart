import 'package:bonemeal/src/asset/asset_writer.dart';
import 'package:bonemeal/src/io/build_cache.dart';
import 'package:bonemeal/src/meta_object/writter.dart';

import 'build_cache.dart';

/// A class responsible for interacting with the outside world
class Environment {
  Environment() : _cache = BuildCache() {}

  final BuildCache _cache;

  SyncAssetWriter get writer => _buildCache;
}
