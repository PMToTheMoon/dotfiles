import 'dart:convert';
import 'dart:math';

import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:glob/glob.dart';
import 'package:path/path.dart' as p;

class BuildStep<Input, Output> extends AssetReader implements AssetWriter {
  BuildStep(
    this._reader,
    this._writer, {
    required this.input,
    String? root,
  }) : _root = root ?? '';

  final AssetReader _reader;
  final AssetReader _writer;

  final Input input;

  final String _root;

  Output build(MetaObject<Input, Output> object, Input input) {
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
  Future<void> writeAsBytes(AssetId id, List<int> bytes) =>
      writeAsBytes(id, bytes);

  @override
  Future<void> writeAsString(AssetId id, String contents,
      {Encoding encoding = utf8},) {
    // TODO: implement writeAsString
    throw UnimplementedError();
  }
}

abstract class MetaObject<Input, BuildMetaData> {
  MetaObject({
    this.root,
  });

  final String? root;

  BuildMetaData build(BuildStep<Input, BuildMetaData> context);
}
