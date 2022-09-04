import 'package:bonemeal/src/asset/asset_id.dart';
import 'package:bonemeal/src/asset/asset_reader.dart';
import 'package:bonemeal/src/asset/asset_writer.dart';
import 'package:bonemeal/src/asset/writers/file_based.dart';
import 'package:bonemeal/src/constants.dart';

import '../asset/writers/directory_reader_writer.dart';

class BuildCache extends SyncAssetWriter, SyncAssetReader {
  BuildCache();

  final _cacheWriterSpy = SyncAssetWriterSpy(FileBasedAssetWriter());
  late final _cacheWriter = DirectoryAssetWriter(kCacheDir, _cacheWriterSpy);
  final _reader = DirectoryAssetReader(kCacheDir, FileBasedAssetReader());

  @override
  String readAsString(AssetId id) => _reader.readAsString(id);
}
