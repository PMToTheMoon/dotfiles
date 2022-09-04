import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/src/generate/input_matcher.dart';
import 'node.dart';

class AssetGraph {
  /// All the [AssetNode]s in the graph, indexed by package and then path.
  final _nodesByPackage = const <String, Map<String, AssetNode>>{};

  AssetGraph.fromSources(Set<AssetId> sources) {
    _addSources(sources);
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

  /// Gets all [AssetNode] filter by matcher.
  Set<AssetNode>? getAllMatches(InputMatcher matcher) {
    _nodesByPackage.values.map((e) => e.values);
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

  /// Adds [node] to the graph if it doesn't exist.
  ///
  /// Throws a [StateError] if it already exists in the graph.
  void _add(AssetNode node) {
    if (contains(node.id)) {
      throw StateError(
          'Tried to add node ${node.id} to the asset graph but it already '
          'exists.');
    }
    _nodesByPackage.putIfAbsent(node.id.package, () => {})[node.id.path] = node;
  }
}
