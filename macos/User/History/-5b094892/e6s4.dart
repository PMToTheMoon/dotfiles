import 'package:bonemeal_runner/src/asset/writer.dart';
import 'package:file/memory.dart';

final _fs = MemoryFileSystem();

/// An [RunnerAssetWriter] that use an in-memory file system
class InMemoryAssetWriter implements RunnerAssetWriter {
  /// The filesystem abstraction to use. By default all the memory
  /// a asset writer and reader use the same filesystem instance.
  final MemoryFileSystem fs;
}
