import 'dart:convert';
import 'dart:math';

import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/src/asset/reader.dart';
import 'package:bonemeal_runner/src/asset/writer.dart';
import 'package:crypto/crypto.dart';
import 'package:file/memory.dart';
import 'package:glob/glob.dart';
import 'package:path/path.dart' as path;

final _defaultFileSystem = MemoryFileSystem();

class InMemoryAssetReader extends AssetReader implements RunnerAssetReader {
  /// The filesystem abstraction to use. By default all the memory
  /// a asset writer and reader use the same filesystem instance.
  final MemoryFileSystem _fs;

  InMemoryAssetReader(MemoryFileSystem? fs) : _fs = fs ?? _defaultFileSystem;

  @override
  Future<List<int>> readAsBytes(AssetId id) =>
      _fs.file(_pathFor(id)).readAsBytes();

  @override
  Future<String> readAsString(AssetId id, {Encoding encoding = utf8}) =>
      _fs.file(_pathFor(id)).readAsString(encoding: encoding);

  @override
  Future<bool> canRead(AssetId id) => _fs.file(_pathFor(id)).exists();

  @override
  Stream<AssetId> findAssets(Glob glob, {String? package}) =>
      throw UnimplementedError(
          'Asset globbing should be done per phase with the AssetGraph');
}

/// An [RunnerAssetWriter] that use an in-memory file system
class InMemoryAssetWriter implements RunnerAssetWriter {
  /// The filesystem abstraction to use. By default all the memory
  /// a asset writer and reader use the same filesystem instance.
  final MemoryFileSystem _fs;

  InMemoryAssetWriter(MemoryFileSystem? fs) : _fs = fs ?? _defaultFileSystem;

  @override
  Future delete(AssetId id) => _fs.file(_pathFor(id)).delete();

  @override
  Future<void> writeAsBytes(AssetId id, List<int> bytes) async {
    final file = _fs.file(_pathFor(id));
    if (!await file.exists()) {
      await file.create(recursive: true);
    }
    await file.writeAsBytes(bytes);
  }

  @override
  Future<void> writeAsString(AssetId id, String contents,
      {Encoding encoding = utf8}) async {
    final file = _fs.file(_pathFor(id))..create(recursive: true);
    if (!await file.exists()) {
      await file.create(recursive: true);
    }
    await file.writeAsString(contents, encoding: encoding);
  }
}

String _pathFor(AssetId id) {
  return path.join(id.package, id.path);
}
