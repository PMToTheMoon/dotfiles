class AssetGraph {
  /// All the [AssetNode]s in the graph, indexed by package and then path.
  final _nodesByPackage = const <String, Map<String, AssetNode>>{};
}

class AssetNode {}
