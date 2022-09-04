import 'package:bonemeal/bonemeal.dart';
import 'node.dart';

class AssetGraph {
  /// All the [AssetNode]s in the graph, indexed by package and then path.
  final _nodesByPackage = const <String, Map<String, AssetNode>>{};

  AssetGraph.fromSources(Set<AssetId> sources) {
    for (final source in sources) {}
  }

  /// Checks if [id] exists in the graph.
  bool contains(AssetId id) =>
      _nodesByPackage[id.package]?.containsKey(id.path) ?? false;

  /// Gets the [AssetNode] for [id], if one exists.
  AssetNode? get(AssetId id) {
    var pkg = _nodesByPackage[id.package];
    if (pkg == null) return null;
    return pkg[id.path];
  }

  /// Adds [assetIds] as [AssetNode]s to this graph, and returns the newly
  /// created nodes.
  List<AssetNode> _addSources(Set<AssetId> assetIds) {
    return assetIds.map((id) {
      var node = SourceAssetNode(id);
      _add(node);
      return node;
    }).toList();
  }
}
