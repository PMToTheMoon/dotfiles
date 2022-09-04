import 'package:bonemeal/bonemeal.dart';

abstract class AssetNode {
  final AssetId id;

  const AssetNode(this.id);

  bool get isGenerated => false;

  bool get isHidden => false;
}
