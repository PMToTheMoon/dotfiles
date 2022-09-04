import 'dart:async';
import 'dart:convert';

import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_runner/src/asset_graph/graph.dart';
import 'package:crypto/crypto.dart';
import 'package:glob/glob.dart';

import 'writer.dart';

class BuildStepReader implements PathProvidingAssetReader {
  final AssetGraph _assetGraph;
  final PathProvidingAssetReader _delegate;

  BuildStepReader(this._delegate, this._assetGraph);

  @override
  Future<bool> canRead(AssetId id) =>
      _delegate.canRead(_contextualizePath(id, _assetGraph));

  @override
  Future<Digest> digest(AssetId id) =>
      _delegate.digest(_contextualizePath(id, _assetGraph));

  @override
  Future<List<int>> readAsBytes(AssetId id) =>
      _delegate.readAsBytes(_contextualizePath(id, _assetGraph));

  @override
  Future<String> readAsString(AssetId id, {Encoding encoding = utf8}) =>
      _delegate.readAsString(_contextualizePath(id, _assetGraph),
          encoding: encoding);

  @override
  Stream<AssetId> findAssets(Glob glob) => throw UnimplementedError(
      'Asset globbing should be done per phase with the AssetGraph');

  @override
  String pathTo(AssetId id) => _delegate.pathTo(id);
}

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
    return _delegate.writeAsBytes(_contextualizePath(id, _assetGraph), content);
  }

  @override
  Future writeAsString(AssetId id, String content, {Encoding encoding = utf8}) {
    _assetGraph.add(id);
    return _delegate.writeAsString(_contextualizePath(id, _assetGraph), content,
        encoding: encoding);
  }

  @override
  Future delete(AssetId id) {
    _assetGraph.remove(id);
    return _delegate.delete(_contextualizePath(id, _assetGraph));
  }
}

/// TODO: redirect to build cache if id is ipr or output
AssetId _contextualizePath(AssetId id, AssetGraph assetGraph) {
  return id;
}
