import 'dart:convert';

import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:glob/glob.dart';
import 'package:path/path.dart' as p;

class BuildStep<Data, Output> extends PathProvidingAssetReader
    implements AssetWriter {
  BuildStep(
    this._reader,
    this._writer, {
    required this.input,
    String? root,
  }) : _root = root ?? '';

  final PathProvidingAssetReader _reader;
  final AssetWriter _writer;

  final Data input;

  final String _root;

  Output build(MetaObject<Data, Output> object, Data input) {
    // TODO: more robust nested path (packages, asbolute and relative paths)
    final root = p.join(_root, object.root);
    return object.build(
      BuildStep(
        _reader,
        _writer,
        input: input,
        root: root,
      ),
    );
  }

  @override
  Future<bool> canRead(AssetId id) => _reader.canRead(id);

  @override
  Stream<AssetId> findAssets(Glob glob) => _reader.findAssets(glob);

  @override
  Future<List<int>> readAsBytes(AssetId id) => _reader.readAsBytes(id);

  @override
  Future<String> readAsString(AssetId id, {Encoding encoding = utf8}) =>
      _reader.readAsString(id, encoding: encoding);

  @override
  String pathTo(AssetId id) => _reader.pathTo(id);

  @override
  Future<void> writeAsBytes(AssetId id, List<int> bytes) =>
      _writer.writeAsBytes(id, bytes);

  @override
  Future<void> writeAsString(
    AssetId id,
    String content, {
    Encoding encoding = utf8,
  }) =>
      _writer.writeAsString(id, content, encoding: encoding);
}

abstract class MetaObject<Data, BuildMetaData> {
  MetaObject({
    this.root,
  });

  final String? root;

  BuildMetaData build(BuildStep<Data, BuildMetaData> context);
}
