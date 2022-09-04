class AssetId {
  AssetId(this.path);
  String path;
}

class Writter {
  Future<void> writeAsString(String content);
}
