import 'package:bonemeal_core/bonemeal_core.dart';
import 'input_matcher.dart';
import 'node.dart';

class AssetGraph {
  /// All the [AssetNode]s in the graph, indexed by package and then path.
  final _nodesByPackage = <AssetType, Map<String, AssetNode>>{};

  AssetGraph.fromSources(Set<AssetId> sources) {
    _addSources(sources);
  }

  /// Checks if [id] exists in the graph.
  bool contains(AssetId id) =>
      _nodesByPackage[id.type]?.containsKey(id.path) ?? false;

  /// Gets the [AssetNode] for [id], if one exists.
  AssetNode? get(AssetId id, {bool showHidden = false}) {
    var pkg = _nodesByPackage[id.type];
    if (pkg == null) return null;
    final node = pkg[id.path];
    if (node != null && !node.isHidden || showHidden) return node;
    return null;
  }

  /// Gets all [AssetNode] filter by matcher.
  Set<AssetNode> getAllMatches(
    DataMatcher matcher, {
    bool showHidden = false,
  }) {
    return _nodesByPackage.values
        .map((e) => e.values)
        .expand((e) => e)
        .where((node) => matcher.matches(node.id))
        .where((node) => showHidden || !node.isHidden)
        .toSet();
  }

  Set<AssetId> getAllGenerated() {
    return _nodesByPackage.values
        .map((e) => e.values)
        .expand((e) => e)
        .where((node) => node.isGenerated)
        .map((node) => node.id)
        .toSet();
  }

  void add(AssetId id, {bool hidden = false}) => _add(AssetNode(id));
  void remove(AssetId id) => _remove(AssetNode(id));

  /// Adds [assetIds] as [AssetNode]s to this graph, and returns the newly
  /// created nodes.
  List<AssetNode> _addSources(Set<AssetId> assetIds) {
    return assetIds.map((id) {
      var node = AssetNode(id);
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
    _nodesByPackage.putIfAbsent(node.id.type, () => {})[node.id.path] = node;
  }

  /// Adds [node] to the graph if it doesn't exist.
  ///
  /// Throws a [StateError] if it already exists in the graph.
  void _remove(AssetNode node) {
    if (get(node.id)?.isGenerated != true) {
      throw StateError(
          "Tried to remove node ${node.id} to the asset graph but it's not "
          'generated ');
    }
    _nodesByPackage[node.id.type]?.remove(node.id.path);
  }
}
