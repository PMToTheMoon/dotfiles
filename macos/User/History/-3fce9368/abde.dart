import 'package:bonemeal/bonemeal.dart';

abstract class AssetNode {
  final AssetId id;

  const AssetNode(this.id);

  bool get isGenerated => id.isIpr || id.isOutput;

  bool get isHidden => false;
}
