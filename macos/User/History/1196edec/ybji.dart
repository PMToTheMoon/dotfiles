import 'dart:io';

import 'package:bonemeal/src/asset/asset_id.dart';
import 'package:bonemeal/src/asset/asset_reader.dart';
import 'package:bonemeal/src/asset/asset_writer.dart';
import 'package:path/path.dart' as p;

/// An asset reader/writer that prefix every path with [dir] path
class DirectoryAssetWriter implements SyncAssetWriter {
  DirectoryAssetWriter(String dir) : _dir = dir;

  final String _dir;

  @override
  void writeAsString(AssetId id, String content) {
    final file = _fileFor(id, _dir);
    file.createSync(recursive: true);
    file.writeAsStringSync(content);
  }
}

mixin DirectoryAssetReader implements SyncAssetReader {
  // DirectoryAssetReader(String dir) : _dir = dir;

  String get dir;

  @override
  String readAsString(AssetId id) {
    final file = _fileFor(id, dir);
    return file.readAsStringSync();
  }
}

File _fileFor(AssetId id, String root) {
  return File(_pathFor(id, root));
}

String _pathFor(AssetId id, String root) {
  return p.join(root, id.path);
}
