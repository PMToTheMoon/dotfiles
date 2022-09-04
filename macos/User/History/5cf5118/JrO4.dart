import 'dart:convert';

import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/src/asset/reader.dart';
import 'package:bonemeal_runner/src/asset/writer.dart';
import 'package:bonemeal_runner/src/asset_graph/graph.dart';
import 'package:glob/glob.dart';

class BuildCacheAssetReader extends AssetReader implements RunnerAssetReader {
  final AssetGraph _assetGraph;

  final MultiPackageAssetReader _reader;

  factory BuildCacheAssetReader({
    required AssetGraph assetGraph,
    required MultiPackageAssetReader reader,
  }) =>
      BuildCacheAssetReader._(assetGraph, reader);

  @override
  Future<bool> canRead(AssetId id) async {
    final node = _assetGraph.get(id);
    if (node != null) {
      if (node.isHidden) return false;
      return _reader.canRead(id);
    }
    return false;
  }

  @override
  Future<List<int>> readAsBytes(AssetId id) async {
    if (await canRead(id)) {
      return _reader.readAsBytes(id);
    }
    throw AssetNotFoundException(id);
  }

  @override
  Future<String> readAsString(AssetId id, {Encoding encoding = utf8}) async {
    if (await canRead(id)) {
      return _reader.readAsString(id, encoding: utf8);
    }
    throw AssetNotFoundException(id);
  }

  @override
  Stream<AssetId> findAssets(Glob glob, {String? package}) {
    throw UnimplementedError();
  }

  BuildCacheAssetReader._(
    this._assetGraph,
    this._reader,
  );
}

class BuildCacheAssetWriter extends AssetWriter implements RunnerAssetWriter {
  final AssetGraph _assetGraph;

  final RunnerAssetWriter _writer;

  factory BuildCacheAssetWriter({
    required AssetGraph assetGraph,
    required RunnerAssetWriter writer,
  }) =>
      BuildCacheAssetWriter._(assetGraph, writer);

  @override
  Future<void> writeAsBytes(AssetId id, List<int> bytes) {
    _assetGraph.add(id, generated: true);
    return _writer.writeAsBytes(id, bytes);
  }

  @override
  Future<void> writeAsString(
    AssetId id,
    String contents, {
    Encoding encoding = utf8,
  }) {
    _assetGraph.add(id, generated: true);
    return _writer.writeAsString(id, contents);
  }

  @override
  Future delete(AssetId id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  BuildCacheAssetWriter._(
    this._assetGraph,
    this._writer,
  );
}

class RelocatedAssetWriter implements AssetWriter {
  final AssetWriter _delegate;
  final String _root;

  RelocatedAssetWriter(this._delegate, this._root);

  @override
  Future writeAsBytes(AssetId id, List<int> content) =>
      _delegate.writeAsBytes(_location(id, _root), content);

  @override
  Future writeAsString(AssetId id, String content,
          {Encoding encoding = utf8}) =>
      _delegate.writeAsString(_location(id, _root), content,
          encoding: encoding);
}

AssetId _location(AssetId id, String root) {
  if (id.path.startsWith(root)) {
    return id;
  }
  return AssetId(
    id.type,
    '$root/${id.path}',
  );
}
