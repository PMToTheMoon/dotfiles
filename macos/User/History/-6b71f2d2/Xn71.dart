import 'package:bonemeal/src/asset/asset_id.dart';

abstract class SyncAssetReader {
  String writeAsString(AssetId id);
}
