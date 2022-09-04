import 'dart:io';

import 'package:bonemeal/src/asset/asset_id.dart';
import 'package:bonemeal/src/asset/asset_reader.dart';
import 'package:bonemeal/src/asset/asset_writer.dart';

class FileBasedAssetWriter implements SyncAssetWriter {
  @override
  void writeAsString(AssetId id, String content) {
    final file = File(_pathFor(id));
    file.createSync(recursive: true);
    file.writeAsStringSync(content);
    print(file.path);
  }
}

class FileBasedAssetReader implements SyncAssetReader {
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
