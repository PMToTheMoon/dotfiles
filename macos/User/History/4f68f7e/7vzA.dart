import 'package:bonemeal/src/asset/asset_id.dart';

abstract class SyncAssetWriter {
  void writeAsString(AssetId id, String content);
}
