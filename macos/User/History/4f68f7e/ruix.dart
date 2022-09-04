import 'package:bonemeal/src/asset/asset_id.dart';

abstract class SyncAssetWriter {
  void writeAsString(AssetId id, String content);
}

class SyncAssetWriterSpy {
  SyncAssetWriterSpy(this._delegate);

  final SyncAssetWriter _delegate;

  void writeAsString(AssetId id, String content);
}
