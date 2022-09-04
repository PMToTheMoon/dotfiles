import 'dart:io';

import 'package:bonemeal/src/asset/asset_id.dart';
import 'package:bonemeal/src/asset/asset_reader.dart';
import 'package:bonemeal/src/asset/asset_writer.dart';
import 'package:bonemeal/src/constants.dart';
import 'package:path/path.dart' as p;

/// An asset reader/writer that prefix every path with [dir] path
class DirectoryAssetReaderWriter implements SyncAssetWriter, SyncAssetReader {
  DirectoryAssetReaderWriter(String dir) : _dir = dir;

  final String _dir;

  @override
  String readAsString(AssetId id) {
    final file = File(_pathFor(id));
    return file.readAsStringSync();
  }

  @override
  void writeAsString(AssetId id, String content) {
    final file = File(_pathFor(id));
    file.createSync(recursive: true);
    file.writeAsStringSync(content);
  }

  String _pathFor(AssetId id) {
    return p.join(_dir, id.path);
  }
}

class BuildCache extends DirectoryAssetReaderWriter {
  BuildCache() : super(kCacheDir);
}
