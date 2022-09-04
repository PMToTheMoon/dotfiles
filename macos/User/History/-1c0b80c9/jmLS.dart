import 'package:bonemeal/src/asset/asset_id.dart';
import 'package:bonemeal/src/asset/asset_reader.dart';
import 'package:bonemeal/src/asset/asset_writer.dart';
import 'package:bonemeal/src/constants.dart';

import 'directory_reader_writer.dart';

// class BuildCache extends DirectoryAssetReaderWriter {
//   BuildCache() : super(kCacheDir);
// }

class BuildCache extends SyncAssetWriterSpy with SyncAssetReader {
  BuildCache() : super(DirectoryAssetWriter(kCacheDir));

  final _delegate = DirectoryAssetReaderWriter(kCacheDir);

  @override
  String readAsString(AssetId id) {
    // TODO: implement readAsString
    throw UnimplementedError();
  }
}
