import 'package:bonemeal_core/src/asset/asset_id.dart';

abstract class SyncAssetWriter {
  void writeAsString(AssetId id, String content);
}

class SyncAssetWriterSpy implements SyncAssetWriter {
  SyncAssetWriterSpy(this._delegate);

  final SyncAssetWriter _delegate;

  // every written files
  final Set<AssetId> _writtenAssets = {};

  Iterable<AssetId> get writtenAssets => _writtenAssets;

  @override
  void writeAsString(AssetId id, String content) {
    _writtenAssets.add(id);
    _delegate.writeAsString(id, content);
  }
}
