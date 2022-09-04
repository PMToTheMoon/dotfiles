import 'package:bonemeal_runner/src/asset/writer.dart';
import 'package:file/memory.dart';

final _fs = MemoryFileSystem();

/// An [RunnerAssetWriter] that use an in-memory file system
class InMemoryAssetWriter implements RunnerAssetWriter {
  /// The filesystem abstraction to use. By default all the memory
  /// a asset writer and reader use the same filesystem instance.
  final MemoryFileSystem fs;

  InMemoryAssetWriter(MemoryFileSystem? fs) : fs = fs ?? _fs;

  @override
  Future delete(AssetId id);

  /// Writes [bytes] to a binary file located at [id].
  ///
  /// Returns a [Future] that completes after writing the asset out.
  ///
  /// * Throws a `PackageNotFoundException` if `id.package` is not found.
  /// * Throws an `InvalidOutputException` if the output was not valid.
  Future<void> writeAsBytes(AssetId id, List<int> bytes);

  /// Writes [contents] to a text file located at [id] with [encoding].
  ///
  /// Returns a [Future] that completes after writing the asset out.
  ///
  /// * Throws a `PackageNotFoundException` if `id.package` is not found.
  /// * Throws an `InvalidOutputException` if the output was not valid.
  Future<void> writeAsString(AssetId id, String contents,
      {Encoding encoding = utf8});
}
