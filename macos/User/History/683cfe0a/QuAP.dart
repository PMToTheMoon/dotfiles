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
      _delegate.pathTo(_cacheLocation(id, _assetGraph));
}

class BuildCacheWriter implements RunnerAssetWriter {
  final AssetGraph _assetGraph;
  final RunnerAssetWriter _delegate;

  BuildCacheWriter(this._delegate, this._assetGraph);

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
