import 'package:bonemeal/bonemeal.dart';

abstract class AssetNode {
  final AssetId id;

  const AssetNode(this.id);

  bool get isGenerated => false;

  bool get isHidden => false;
}

/// A node which is an original source asset (not generated).
class SourceAssetNode extends AssetNode {
  const SourceAssetNode(super.id);

  @override
  String toString() => 'SourceAssetNode: $id';
}

class GeneratedAssetNode extends AssetNode {
  @override
  bool get isGenerated => true;
}
