import 'dart:io';

import 'package:bonemeal/src/asset/asset_id.dart';

class FileBasedAssetWriter {
  @override
  void writeAsString(AssetId id, String content) {
    final file = File(_pathFor(id));
    file.createSync(recursive: true);
    file.writeAsStringSync(content);
  }
}

class FileBasedAssetReader {
  @override
  String readAsString(AssetId id) {
    final file = _fileFor(id);
    return file.readAsStringSync();
  }
}

File _fileFor(AssetId id) {
  return File(_pathFor(id));
}

String _pathFor(AssetId id) {
  return id.path;
}
