import 'dart:async';
import 'dart:convert';

import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/src/asset_graph/graph.dart';
import 'package:bonemeal_runner/src/utils/constants.dart';
import 'package:crypto/crypto.dart';
import 'package:glob/glob.dart';

import 'reader.dart';
import 'writer.dart';

/// Wraps an [AssetReader] and translates reads for generated files into reads
/// from the build cache directory
class BuildCacheReader implements AssetReader {
  final AssetGraph _assetGraph;
  final AssetReader _delegate;
  final String _rootPackage;

  BuildCacheReader._(this._delegate, this._assetGraph, this._rootPackage);

  factory BuildCacheReader(
          AssetReader delegate, AssetGraph assetGraph, String rootPackage) =>
      delegate is PathProvidingAssetReader
          ? _PathProvidingBuildCacheReader._(delegate, assetGraph, rootPackage)
          : BuildCacheReader._(delegate, assetGraph, rootPackage);

  @override
  Future<bool> canRead(AssetId id) =>
      _delegate.canRead(_cacheLocation(id, _assetGraph, _rootPackage));

  @override
  Future<Digest> digest(AssetId id) =>
      _delegate.digest(_cacheLocation(id, _assetGraph, _rootPackage));

  @override
  Future<List<int>> readAsBytes(AssetId id) =>
      _delegate.readAsBytes(_cacheLocation(id, _assetGraph, _rootPackage));

  @override
  Future<String> readAsString(AssetId id, {Encoding encoding = utf8}) =>
      _delegate.readAsString(_cacheLocation(id, _assetGraph, _rootPackage),
          encoding: encoding);

  @override
  Stream<AssetId> findAssets(Glob glob) => throw UnimplementedError(
      'Asset globbing should be done per phase with the AssetGraph');
}

class _PathProvidingBuildCacheReader extends BuildCacheReader
    implements PathProvidingAssetReader {
  @override
  PathProvidingAssetReader get _delegate =>
      super._delegate as PathProvidingAssetReader;

  _PathProvidingBuildCacheReader._(PathProvidingAssetReader delegate,
      AssetGraph assetGraph, String rootPackage)
      : super._(delegate, assetGraph, rootPackage);

  @override
  String pathTo(AssetId id) =>
      _delegate.pathTo(_cacheLocation(id, _assetGraph, _rootPackage));
}

class BuildCacheWriter implements RunnerAssetWriter {
  final AssetGraph _assetGraph;
  final RunnerAssetWriter _delegate;
  final String _rootPackage;

  BuildCacheWriter(this._delegate, this._assetGraph, this._rootPackage);

  @override
  Future writeAsBytes(AssetId id, List<int> content) => _delegate.writeAsBytes(
      _cacheLocation(id, _assetGraph, _rootPackage), content);

  @override
  Future writeAsString(AssetId id, String content,
          {Encoding encoding = utf8}) =>
      _delegate.writeAsString(
          _cacheLocation(id, _assetGraph, _rootPackage), content,
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