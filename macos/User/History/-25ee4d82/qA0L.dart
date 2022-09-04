import 'package:bonemeal/bonemeal.dart';

abstract class AssetNode {
  AssetId get id;

  bool get isGenerated => false;
}
