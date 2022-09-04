import 'package:bonemeal/src/asset/asset_id.dart';

abstract class AssetWriter {
  String writeAsString(AssetId id, String content);
}
