import 'package:bonemeal/src/asset/asset_writer.dart';
import 'package:bonemeal/src/config/bonemeal_config.dart';
import 'package:logging/logging.dart';

import 'build_cache.dart';

final _log = Logger('IOEnvironment');

/// A class responsible for interacting with the outside world
class IOEnvironment {
  IOEnvironment({
    required this.config,
  }) : _cache = BuildCache() {
    _log.info('Initializing environment.');
    // _initialize
    _log.fine('Environment initialized.');
  }

  final BonemealConfig config;
  final BuildCache _cache;

  SyncAssetWriter get writer => _cache;
}
