import 'package:bonemeal_core/bonemeal_core';

class AssetNode {
  final AssetId id;

  final bool isHidden;

  const AssetNode(this.id, {this.isHidden = false});

  bool get isGenerated => id.isIpr || id.isOutput;
}
