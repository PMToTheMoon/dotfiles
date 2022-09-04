import 'dart:convert';

import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/src/asset/in_memory.dart';
import 'package:bonemeal_runner/src/asset/reader.dart';
import 'package:bonemeal_runner/src/asset_graph/graph.dart';
import 'package:file/memory.dart';
import 'package:glob/glob.dart';

class BuildAssetReader extends AssetReader implements RunnerAssetReader {
  final MemoryFileSystem _fs;

  final AssetGraph assetGraph;

  final MultiPackageAssetReader reader;

  factory BuildAssetReader(
    AssetGraph _fs, {
    required AssetGraph assetGraph,
    MultiPackageAssetReader? reader,
  }) {}

  @override
  Future<bool> canRead(AssetId id) async {
    final node = assetGraph.get(id);
    if (node != null) {
      if (node.isHidden) return false;
      return reader.canRead(id);
    }
    return false;
  }

  @override
  Future<List<int>> readAsBytes(AssetId id) async {
    if (await canRead(id)) {
      return reader.readAsBytes(id);
    }
    throw AssetNotFoundException(id);
  }

  @override
  Future<String> readAsString(AssetId id, {Encoding encoding = utf8}) {
    // TODO: implement readAsString
    throw UnimplementedError();
  }

  @override
  Stream<AssetId> findAssets(Glob glob, {String? package}) {
    // TODO: implement findAssets
    throw UnimplementedError();
  }

  BuildAssetReader._(
    this._fs, {
    required this.assetGraph,
    required this.reader,
  });
}

class BuildAssetWriter extends AssetWriter {
  final MemoryFileSystem _fs;

  BuildAssetWriter(this._fs);

  @override
  Future<void> writeAsBytes(AssetId id, List<int> bytes) {
    throw UnimplementedError();
  }

  @override
  Future<void> writeAsString(
    AssetId id,
    String contents, {
    Encoding encoding = utf8,
  }) {
    throw UnimplementedError();
  }
}
