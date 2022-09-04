import 'dart:convert';

import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/src/asset/reader.dart';
import 'package:bonemeal_runner/src/asset/writer.dart';
import 'package:bonemeal_runner/src/asset_graph/graph.dart';
import 'package:crypto/src/digest.dart';
import 'package:file/memory.dart';
import 'package:glob/glob.dart';

class BuildAssetReader extends AssetReader implements RunnerAssetReader {
  final AssetGraph _assetGraph;

  final MultiPackageAssetReader _reader;

  factory BuildAssetReader({
    required AssetGraph assetGraph,
    required MultiPackageAssetReader reader,
  }) =>
      BuildAssetReader._(assetGraph, reader);

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

  BuildAssetReader._(
    this._assetGraph,
    this._reader,
  );
}

class BuildAssetWriter extends AssetWriter implements RunnerAssetWriter {
  final AssetGraph _assetGraph;

  final RunnerAssetWriter _writer;

  factory BuildAssetWriter({
    required AssetGraph assetGraph,
    required MultiPackageAssetReader reader,
  }) =>
      BuildAssetWriter._(assetGraph, reader);

  @override
  Future<void> writeAsBytes(AssetId id, List<int> bytes) =>
      _writer.writeAsBytes(id, bytes);

  @override
  Future<void> writeAsString(
    AssetId id,
    String contents, {
    Encoding encoding = utf8,
  }) =>
      writeAsString(id, contents);

  @override
  Future delete(AssetId id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  BuildAssetWriter._(
    this._assetGraph,
    this._writer,
  );
}
