import 'package:bonemeal/src/constants.dart';

import 'directory_reader_writter.dart';

class BuildCache extends DirectoryAssetReaderWriter {
  BuildCache() : super(kCacheDir);
}
