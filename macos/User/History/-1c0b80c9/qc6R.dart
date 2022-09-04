import 'package:bonemeal/src/asset/asset_id.dart';
import 'package:bonemeal/src/asset/asset_reader.dart';
import 'package:bonemeal/src/asset/asset_writer.dart';
import 'package:bonemeal/src/constants.dart';

import 'directory_reader_writer.dart';

// class BuildCache extends DirectoryAssetReaderWriter {
//   BuildCache() : super(kCacheDir);
// }

class BuildCache extends SyncAssetWriterSpy with DirectoryAssetReader {
  BuildCache() : super(DirectoryAssetWriter(kCacheDir));

  @override
  final dir = kCacheDir;
}
