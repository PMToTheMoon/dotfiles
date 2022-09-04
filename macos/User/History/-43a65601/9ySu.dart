import 'dart:async';
import 'dart:convert';

import 'package:glob/glob.dart';
import 'package:bonemeal_core/bonemeal_core.dart';

class BuildStepImpl extends BuildStep {
  final AssetReader _reader;
  final AssetWriter _writer;

  BuildStepImpl({
    required this.inputs,
    required AssetReader reader,
    required AssetWriter writer,
  })  : _reader = reader,
        _writer = writer;

  @override
  final Set<AssetId> inputs;

  @override
  FutureOr<void> buildMetaObject(MetaObject object, AssetId source) {
    final context = BuildContext(source: source);
    return object.build(context);
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
      _writer.writeAsBytes(id, bytes);

  @override
  Future<void> writeAsString(AssetId id, String content,
          {Encoding encoding = utf8}) =>
      _writer.writeAsString(id, content, encoding: encoding);
}
