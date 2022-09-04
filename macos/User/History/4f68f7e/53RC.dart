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

  UnmodifiableSetView get writtenFiles => UnmodifiableSetView(_writtenFiles);

  void writeAsString(AssetId id, String content);
}
