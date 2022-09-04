import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/src/asset/writer.dart';
import 'package:file/memory.dart';
import 'package:path/path.dart' as path;

final _defaultFileSystem = MemoryFileSystem();

/// An [RunnerAssetWriter] that use an in-memory file system
class InMemoryAssetWriter implements RunnerAssetWriter {
  /// The filesystem abstraction to use. By default all the memory
  /// a asset writer and reader use the same filesystem instance.
  final MemoryFileSystem _fs;

  InMemoryAssetWriter(MemoryFileSystem? fs) : _fs = fs ?? _defaultFileSystem;

  @override
  Future delete(AssetId id) => _fs.file(_pathFor(id)).delete();

  @override
  Future<void> writeAsBytes(AssetId id, List<int> bytes);

  @override
  Future<void> writeAsString(AssetId id, String contents,
      {Encoding encoding = utf8});
}

String _pathFor(AssetId id) {
  return path.join(id.package, id.path);
}
