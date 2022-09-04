import 'dart:collection';

import 'package:bonemeal/src/asset/asset_id.dart';

abstract class SyncAssetWriter {
  void writeAsString(AssetId id, String content);
}

class SyncAssetWriterSpy {
  SyncAssetWriterSpy(this._delegate);

  final SyncAssetWriter _delegate;

  // every written files
  final Set<String> _writtenFiles;

  Set<String> get _writtenFiles;

  void writeAsString(AssetId id, String content);
}
