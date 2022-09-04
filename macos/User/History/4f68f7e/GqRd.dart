import 'package:bonemeal/src/asset/asset_id.dart';

abstract class AssetWriter {
  Future<String> writeAsString(AssetId id, String content);
}
