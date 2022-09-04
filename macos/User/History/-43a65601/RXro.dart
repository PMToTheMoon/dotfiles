import 'dart:async';
import 'dart:convert';

import 'package:bonemeal_runner/src/asset/reader.dart';
import 'package:bonemeal_runner/src/asset/writer.dart';
import 'package:glob/glob.dart';
import 'package:bonemeal_core/bonemeal_core.dart';

import 'package:bonemeal_runner/src/meta_object/context_impl.dart';

class BuildStepImpl extends BuildStep {
  final RunnerAssetReader _reader;
  final RunnerAssetWriter _writer;

  BuildStepImpl({
    required this.inputs,
    required AssetReader reader,
    required AssetWriter writer,
  })  : _reader = reader,
        _writer = writer;

  @override
  final Set<AssetId> inputs;

  @override
  FutureOr<void> buildMetaObject<T>(
    MetaObject<T> object,
    AssetId source,
    T data,
  ) {
    final context = BuildContextImpl(
      source: source,
      reader: _reader,
      writer: _writer,
    );
    return object.build(context, data);
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
