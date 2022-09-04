import 'package:bonemeal/bonemeal.dart';

abstract class AssetNode {
  final AssetId id;

  const AssetNode(this.id);

  bool get isGenerated => id.isIpr || id.isOutput;

  bool get isHidden => false;
}

class GeneratedAssetNode extends AssetNode {
  GeneratedAssetNode(super.id) : assert(id.isIpr || id.isOutput);
}

class SourceAssetNode extends AssetNode {
  SourceAssetNode(super.id) : assert(id.isInput || id.isPackage);
}
