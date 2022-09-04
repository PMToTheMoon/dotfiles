import 'dart:async';
import 'dart:convert';

import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/src/asset_graph/graph.dart';
import 'package:bonemeal_runner/src/utils/constants.dart';
import 'package:glob/glob.dart';

import 'writer.dart';

/// Wraps an [AssetReader] and translates reads for generated files into reads
/// from the build cache directory
class BuildStepReader implements AssetReader {
  final AssetGraph _assetGraph;
  final AssetReader _delegate;

  BuildStepReader._(this._delegate, this._assetGraph);

  factory BuildStepReader(AssetReader delegate, AssetGraph assetGraph) =>
      BuildStepReader._(delegate, assetGraph);

  @override
  Future<bool> canRead(AssetId id) =>
      _delegate.canRead(_cacheLocation(id, _assetGraph));

  @override
  Future<Digest> digest(AssetId id) =>
      _delegate.digest(_cacheLocation(id, _assetGraph));

  @override
  Future<List<int>> readAsBytes(AssetId id) =>
      _delegate.readAsBytes(_cacheLocation(id, _assetGraph));

  @override
  Future<String> readAsString(AssetId id, {Encoding encoding = utf8}) =>
      _delegate.readAsString(_cacheLocation(id, _assetGraph),
          encoding: encoding);

  @override
  Stream<AssetId> findAssets(Glob glob) => throw UnimplementedError(
      'Asset globbing should be done per phase with the AssetGraph');
}

class BuildStepWriter implements RunnerAssetWriter {
  final AssetGraph _assetGraph;
  final RunnerAssetWriter _delegate;

  BuildStepWriter(this._delegate, this._assetGraph);

  @override
  Future writeAsBytes(AssetId id, List<int> content) =>
      _delegate.writeAsBytes(_cacheLocation(id, _assetGraph), content);

  @override
  Future writeAsString(AssetId id, String content,
          {Encoding encoding = utf8}) =>
      _delegate.writeAsString(_cacheLocation(id, _assetGraph), content,
          encoding: encoding);

  @override
  Future delete(AssetId id) =>
      _delegate.delete(_cacheLocation(id, _assetGraph));
}

AssetId _cacheLocation(AssetId id, AssetGraph assetGraph) {
  if (id.path.startsWith(cacheDir)) {
    return id;
  }
  if (!assetGraph.contains(id)) {
    return id;
  }
  final assetNode = assetGraph.get(id);
  if (assetNode?.isGenerated == true) {
    if (id.isIpr) {
      return AssetId.ipr('$iprBuildCacheDir/${id.path}');
    }
    if (id.isOutput) {
      return AssetId.output('$outputBuildCacheDir/${id.path}');
    }
  }
  return id;
}
