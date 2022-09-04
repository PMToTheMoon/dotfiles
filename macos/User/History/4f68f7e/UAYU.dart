import 'dart:collection';

import 'package:bonemeal/src/asset/asset_id.dart';

abstract class SyncAssetWriter {
  void writeAsString(AssetId id, String content);
}

class SyncAssetWriterSpy {
  SyncAssetWriterSpy(this._delegate);

  final SyncAssetWriter _delegate;

  // every written files
  final Set<AssetId> _writtenAssets = {};

  UnmodifiableSetView get writtenAssets => UnmodifiableSetView(_writtenAssets);

  void writeAsString(AssetId id, String content) {
    _writtenAssets.add(id);
    _delegate.writeAsString(id, content);
  }
}
