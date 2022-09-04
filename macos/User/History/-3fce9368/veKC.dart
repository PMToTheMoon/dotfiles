import 'package:bonemeal/bonemeal.dart';

abstract class AssetNode {
  final AssetId id;

  final bool isHidden;

  const AssetNode(this.id, {this.isHidden = false});

  bool get isGenerated => id.isIpr || id.isOutput;
}

class GeneratedAssetNode extends AssetNode {
  GeneratedAssetNode(
    super.id, {
    super.isHidden,
  }) : assert(id.isIpr || id.isOutput);
}

class SourceAssetNode extends AssetNode {
  SourceAssetNode(super.id) : assert(id.isInput || id.isPackage);
}
