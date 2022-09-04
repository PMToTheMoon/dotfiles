import 'package:bonemeal/bonemeal.dart';

abstract class AssetNode {
  AssetId get id;

  bool get isGenerated => false;
}

/// A node which is an original source asset (not generated).
class SourceAssetNode extends AssetNode {
  SourceAssetNode(AssetId id, {Digest? lastKnownDigest})
      : super(id, lastKnownDigest: lastKnownDigest);

  @override
  String toString() => 'SourceAssetNode: $id';
}
