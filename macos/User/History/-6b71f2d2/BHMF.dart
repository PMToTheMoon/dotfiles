import 'package:bonemeal_core/src/asset/asset_id.dart';

abstract class SyncAssetReader {
  String readAsString(AssetId id);
}
