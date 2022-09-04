import 'dart:io';

class FileBasedAssetWriter {}

class FileBasedAssetReader {}

File _fileFor(AssetId id) {
  return File(_pathFor(id));
}

String _pathFor(AssetId id) {
  return id.path;
}
