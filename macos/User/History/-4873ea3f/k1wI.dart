class FileBasedAssetWriter {}

class FileBasedAssetReader {}

File _fileFor(AssetId id, String root) {
  return File(_pathFor(id, root));
}

String _pathFor(AssetId id) {
  return id.path;
}
