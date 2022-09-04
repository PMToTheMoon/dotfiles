import 'package:bonemeal/bonemeal.dart';

class AssetGraph {
  /// All the [AssetNode]s in the graph, indexed by package and then path.
  final _nodesByPackage = const <String, Map<String, AssetNode>>{};
}

abstract class AssetNode {
  AssetId get id;

  bool get isGenerated => false;
}
