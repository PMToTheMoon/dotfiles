import 'package:bonemeal/src/asset/asset_id.dart';

abstract class SyncAssetWriter {
  String writeAsString(AssetId id, String content);
}
