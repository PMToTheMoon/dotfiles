import 'package:bonemeal/bonemeal.dart';

class AssetGraph {
  /// All the [AssetNode]s in the graph, indexed by package and then path.
  final _nodesByPackage = const <String, Map<String, AssetNode>>{};

  /// Checks if [id] exists in the graph.
  bool contains(AssetId id) =>
      _nodesByPackage[id.package]?.containsKey(id.path) ?? false;

  /// Gets the [AssetNode] for [id], if one exists.
  AssetNode? get(AssetId id) {
    var pkg = _nodesByPackage[id.package];
    if (pkg == null) return null;
    return pkg[id.path];
  }
}

abstract class AssetNode {
  AssetId get id;

  bool get isGenerated => false;
}
