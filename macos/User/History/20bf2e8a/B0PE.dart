import 'dart:async';
import 'dart:convert';

import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_runner/src/asset_graph/graph.dart';

import 'writer.dart';

//TODO: hide input
//TODO: consume input
/// Wraps an [AssetWriter] and and keep update the asset graph based on a
/// generator configuration
class BuildStepWriter implements RunnerAssetWriter {
  final AssetGraph _assetGraph;
  final RunnerAssetWriter _delegate;

  BuildStepWriter(this._delegate, this._assetGraph);

  @override
  Future writeAsBytes(AssetId id, List<int> content) {
    _assetGraph.add(id);
    return _delegate.writeAsBytes(id, content);
  }

  @override
  Future writeAsString(AssetId id, String content, {Encoding encoding = utf8}) {
    _assetGraph.add(id);
    return _delegate.writeAsString(id, content, encoding: encoding);
  }

  @override
  Future delete(AssetId id) {
    _assetGraph.remove(id);
    return _delegate.delete(id);
  }
}
