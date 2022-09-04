import 'dart:io';

import 'package:bonemeal/src/asset/asset_id.dart';
import 'package:bonemeal/src/asset/asset_reader.dart';
import 'package:bonemeal/src/asset/asset_writer.dart';
import 'package:path/path.dart' as p;

/// An asset reader/writer that prefix every path with [dir] path
class DirectoryAssetWriter implements SyncAssetWriter {
  DirectoryAssetWriter(String dir, this._delegate) : _dir = dir;

  final String _dir;
  final SyncAssetWriter _delegate;

  @override
  void writeAsString(AssetId id, String content) {
    _delegate.writeAsString(_pathFor(id, _dir), content);
  }
}

class DirectoryAssetReader implements SyncAssetReader {
  DirectoryAssetReader(String dir, this._delegate) : _dir = dir;

  final String _dir;
  final SyncAssetReader _delegate;

  @override
  String readAsString(AssetId id) {
    return _delegate.readAsString(_pathFor(id, _dir));
  }
}

AssetId _pathFor(AssetId id, String root) {
  return AssetId(p.join(root, id.path));
}
