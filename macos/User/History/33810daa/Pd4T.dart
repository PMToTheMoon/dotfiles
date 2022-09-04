import 'dart:convert';

import 'package:glob/glob.dart';
import 'package:bonemeal/bonemeal.dart';

class BuildStepImpl extends BuildStep {
  final AssetReader _reader;
  final AssetWriter _writer;

  BuildStepImpl({
    required AssetReader reader,
    required AssetWriter writer,
  })  : _reader = reader,
        _writer = writer;

  @override
  Future<bool> canRead(AssetId id) => _reader.canRead(id);

  @override
  Stream<AssetId> findAssets(Glob glob) {
    // TODO: implement findAssets
    throw UnimplementedError();
  }

  @override
  Future<List<int>> readAsBytes(AssetId id) {
    // TODO: implement readAsBytes
    throw UnimplementedError();
  }

  @override
  Future<String> readAsString(AssetId id, {Encoding encoding = utf8}) =>
      _reader.readAsString(id, encoding: encoding);

  @override
  Future<void> writeAsBytes(AssetId id, List<int> bytes) =>
      _writer.writeAsBytes(id, bytes);

  @override
  Future<void> writeAsString(AssetId id, String content,
          {Encoding encoding = utf8}) =>
      _writer.writeAsString(id, content, encoding: encoding);
}
