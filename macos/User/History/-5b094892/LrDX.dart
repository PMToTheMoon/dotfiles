import 'dart:convert';

import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/src/asset/reader.dart';
import 'package:bonemeal_runner/src/asset/writer.dart';
import 'package:file/memory.dart';
import 'package:path/path.dart' as path;

final _defaultFileSystem = MemoryFileSystem();

class InMemoryAssetReader implements RunnerAssetReader {
  Future<List<int>> readAsBytes(AssetId id);

  /// Returns a [Future] that completes with the contents of a text asset.
  ///
  /// When decoding as text uses [encoding], or [utf8] is not specified.
  ///
  /// * Throws a `PackageNotFoundException` if `id.package` is not found.
  /// * Throws a `AssetNotFoundException` if `id.path` is not found.
  /// * Throws an `InvalidInputException` if [id] is an invalid input.
  Future<String> readAsString(AssetId id, {Encoding encoding = utf8});

  /// Indicates whether asset at [id] is readable.
  Future<bool> canRead(AssetId id);

  /// Returns all readable assets matching [glob] under the current package.
  Stream<AssetId> findAssets(Glob glob);

  /// Returns all readable assets matching [glob] under [package].
  ///
  /// Some implementations may require the [package] argument, while others
  /// may have a sane default.
  @override
  Stream<AssetId> findAssets(Glob glob, {String? package});
}

/// An [RunnerAssetWriter] that use an in-memory file system
class InMemoryAssetWriter implements RunnerAssetWriter {
  /// The filesystem abstraction to use. By default all the memory
  /// a asset writer and reader use the same filesystem instance.
  final MemoryFileSystem _fs;

  @override
  Future delete(AssetId id) => _fs.file(_pathFor(id)).delete();

  @override
  Future<void> writeAsBytes(AssetId id, List<int> bytes) =>
      _fs.file(_pathFor(id)).writeAsBytes(bytes);

  @override
  Future<void> writeAsString(AssetId id, String contents,
          {Encoding encoding = utf8}) =>
      _fs.file(_pathFor(id)).writeAsString(contents, encoding: encoding);

  InMemoryAssetWriter(MemoryFileSystem? fs) : _fs = fs ?? _defaultFileSystem;
}

String _pathFor(AssetId id) {
  return path.join(id.package, id.path);
}
