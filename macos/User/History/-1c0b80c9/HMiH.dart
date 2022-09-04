import 'dart:io';

import 'package:bonemeal/src/asset/asset_id.dart';
import 'package:bonemeal/src/asset/asset_reader.dart';
import 'package:bonemeal/src/asset/asset_writer.dart';
import 'package:bonemeal/src/asset/writers/file_based.dart';
import 'package:bonemeal/src/constants.dart';

import '../asset/writers/directory_reader_writer.dart';

class BuildCache extends SyncAssetWriter with SyncAssetReader {
  BuildCache();

  final _writer = SyncAssetWriterSpy(
      DirectoryAssetWriter(kCacheDir, FileBasedAssetWriter()));

  final _reader = DirectoryAssetReader(kCacheDir, FileBasedAssetReader());

  // /// Returns asset written to cache, relative to [kCachePath]
  // Iterable<AssetId> get writtenAssets => _writer.writtenAssets;

  @override
  void writeAsString(AssetId id, String content) =>
      _writer.writeAsString(id, content);

  @override
  String readAsString(AssetId id) => _reader.readAsString(id);

  void exportCache(String path) {
    for (final asset in _writer.writtenAssets) {
      final source = File(p.join(kCacheDir, asset.path));
      final exportPath = p.relative(asset.path, from: config.outputDir);
      File(exportPath).c;
    }
  }
}
