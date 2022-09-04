import 'dart:io';

import 'package:bonemeal/src/asset/asset_writer.dart';
import 'package:bonemeal/src/config/bonemeal_config.dart';
import 'package:bonemeal/src/constants.dart';
import 'package:path/path.dart' as p;
import 'package:logging/logging.dart';

import 'build_cache.dart';

final _log = Logger('IOEnvironment');

/// A class responsible for interacting with the outside world
class IOEnvironment {
  IOEnvironment({
    required this.config,
  }) : _cache = BuildCache();

  final BonemealConfig config;
  final BuildCache _cache;

  SyncAssetWriter get writer => _cache;

  void cleanPreviousBuild() {
    _subtractDir(config.outputDir, kCacheDir);
    _log.fine('Output dir cleaned.');
    _cleanCache();
    _log.fine('Build cache cleaned.');
  }
}

Future<void> _cleanCache() async {
  final dir = Directory(kCacheDir);
  if (await dir.exists()) {
    await dir.delete(recursive: true);
  }
}

/// Remove all files from dir where their file name is contained
/// inside subtract dir (recursive)
Future<void> _subtractDir(String dir, String subtract) async {
  if (p.isAbsolute(subtract) || p.isAbsolute(dir)) {
    throw UnsupportedError("Absolute path aren't supported");
  }
  final sourceDir = Directory(subtract);
  final targetDir = Directory(dir);
  final absoluteTargetDirPath = p.absolute(dir);
  if (await sourceDir.exists() == false || await targetDir.exists() == false) {
    return;
  }
  await for (final sourceFile in sourceDir.list(recursive: true)) {
    if (sourceFile is! File) continue;
    final relativeSource = p.relative(sourceFile.path, from: subtract);
    final targetFilePath = p.absolute(dir, relativeSource);
    if (!p.isWithin(absoluteTargetDirPath, targetFilePath)) {
      throw '${sourceFile.path} file suppression leads '
          'to removing file outside target directory';
    }
    final targetFile = File(targetFilePath);
    if (await targetFile.exists() == true) {
      await targetFile.delete();
      await _removeParentDirIfEmpty(absoluteTargetDirPath, targetFilePath);
    }
  }
}

Future<void> _removeParentDirIfEmpty(String root, String path) async {
  var dir = Directory(p.dirname(path));
  var content = await dir.list().toList();
  while (p.isWithin(root, dir.path) && content.isEmpty) {
    await dir.delete();
    dir = dir.parent;
    content = await dir.list().toList();
  }
}
