import 'dart:io';

import 'package:bonemeal/src/asset/asset_id.dart';

class FileBasedAssetWriter {}

class FileBasedAssetReader {}

File _fileFor(AssetId id) {
  return File(_pathFor(id));
}

String _pathFor(AssetId id) {
  return id.path;
}
