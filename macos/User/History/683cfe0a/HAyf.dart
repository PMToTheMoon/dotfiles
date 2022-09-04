import 'dart:convert';

import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_runner/src/asset/reader.dart';
import 'package:bonemeal_runner/src/asset_graph/graph.dart';
import 'package:crypto/crypto.dart';
import 'package:glob/glob.dart';
import 'package:path/path.dart' as path;

/// Wraps an [AssetReader] and translates reads for generated files into reads
/// from the build cache directory
class BuildCacheReader implements AssetReader {
  final AssetGraph _assetGraph;
  final AssetReader _delegate;

  BuildCacheReader._(this._delegate, this._assetGraph);

  factory BuildCacheReader(AssetReader delegate, AssetGraph assetGraph) =>
      delegate is PathProvidingAssetReader
          ? _PathProvidingBuildCacheReader._(delegate, assetGraph)
          : BuildCacheReader._(delegate, assetGraph);

  @override
  Future<bool> canRead(AssetId id) =>
      _delegate.canRead(_absoluteLocation(id, _assetGraph));

  @override
  Future<Digest> digest(AssetId id) =>
      _delegate.digest(_absoluteLocation(id, _assetGraph));

  @override
  Future<List<int>> readAsBytes(AssetId id) =>
      _delegate.readAsBytes(_absoluteLocation(id, _assetGraph));

  @override
  Future<String> readAsString(AssetId id, {Encoding encoding = utf8}) =>
      _delegate.readAsString(_absoluteLocation(id, _assetGraph),
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

  _PathProvidingBuildCacheReader._(
      PathProvidingAssetReader delegate, AssetGraph assetGraph)
      : super._(delegate, assetGraph);

  @override
  String pathTo(AssetId id) =>
      _delegate.pathTo(_absoluteLocation(id, _assetGraph));
}

class BuildCacheWriter implements RunnerAssetWriter {
  final AssetId _root;
  final RunnerAssetWriter _delegate;

  BuildCacheWriter(this._delegate, this._assetGraph);

  @override
  Future writeAsBytes(AssetId id, List<int> content) =>
      _delegate.writeAsBytes(_absoluteLocation(id, _assetGraph), content);

  @override
  Future writeAsString(AssetId id, String content,
          {Encoding encoding = utf8}) =>
      _delegate.writeAsString(_absoluteLocation(id, _assetGraph), content,
          encoding: encoding);

  @override
  Future delete(AssetId id) => _delegate.delete(_absoluteLocation(id));
}

AssetId _absoluteLocation(
  AssetId root,
  AssetId id,
) {
  if (root.isGenerated && root.type != id.type) {
    throw UnsupportedError(
      'Try to write an asset of type ${id.type} at a relative'
      ' path from a source asset of type ${root.type}',
    );
  }
  if (id.path.startsWith(root.path)) {
    return id;
  }
  return AssetId(id.type, path.join(root.path, id.path));
}
