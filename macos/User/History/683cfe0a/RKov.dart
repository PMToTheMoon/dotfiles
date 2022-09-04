import 'dart:convert';

import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_runner/src/asset/reader.dart';
import 'package:bonemeal_runner/src/asset/writer.dart';
import 'package:crypto/crypto.dart';
import 'package:glob/glob.dart';
import 'package:path/path.dart' as path;

/// Wraps an [AssetReader] and translates reads for generated files into reads
/// from the build cache directory
class RelativePathReader implements PathProvidingAssetReader {
  final String _root;
  final AssetReader _delegate;

  RelativePathReader._(this._delegate, this._root);

  factory RelativePathReader(AssetReader delegate, String root) =>
      delegate is PathProvidingAssetReader
          ? _RelativePathProvidingReader._(delegate, root)
          : RelativePathReader._(delegate, root);

  @override
  Future<bool> canRead(AssetId id) =>
      _delegate.canRead(_absoluteLocation(_root, id));

  @override
  Future<Digest> digest(AssetId id) =>
      _delegate.digest(_absoluteLocation(_root, id));

  @override
  Future<List<int>> readAsBytes(AssetId id) =>
      _delegate.readAsBytes(_absoluteLocation(_root, id));

  @override
  Future<String> readAsString(AssetId id, {Encoding encoding = utf8}) =>
      _delegate.readAsString(_absoluteLocation(_root, id), encoding: encoding);

  @override
  Stream<AssetId> findAssets(Glob glob) => throw UnimplementedError(
      'Asset globbing should be done per phase with the AssetGraph');

  @override
  String pathTo(AssetId id) {
    return _absoluteLocation(_root, id).path;
  }
}

class _RelativePathProvidingReader extends RelativePathReader
    implements PathProvidingAssetReader {
  @override
  PathProvidingAssetReader get _delegate =>
      super._delegate as PathProvidingAssetReader;

  _RelativePathProvidingReader._(PathProvidingAssetReader delegate, String root)
      : super._(delegate, root);

  @override
  String pathTo(AssetId id) => _delegate.pathTo(_absoluteLocation(_root, id));

  @override
  String packagePathTo(AssetId id) =>
      _delegate.packagePathTo(_absoluteLocation(_root, id));
}

class RelativePathWriter implements RunnerAssetWriter {
  final String _root;
  final RunnerAssetWriter _delegate;

  RelativePathWriter(this._delegate, this._root);

  @override
  Future writeAsBytes(AssetId id, List<int> content) =>
      _delegate.writeAsBytes(_absoluteLocation(_root, id), content);

  @override
  Future writeAsString(AssetId id, String content,
          {Encoding encoding = utf8}) =>
      _delegate.writeAsString(_absoluteLocation(_root, id), content,
          encoding: encoding);

  @override
  Future delete(AssetId id) => _delegate.delete(_absoluteLocation(_root, id));
}

AssetId _absoluteLocation(
  String root,
  AssetId id,
) {
  if (id.path.startsWith(root)) {
    return id;
  }
  return AssetId(id.type, path.join(path.dirname(root), id.path));
}
