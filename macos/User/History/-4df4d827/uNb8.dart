import 'dart:async';
import 'dart:convert';

import 'package:bonemeal_runner/src/asset/relative.dart';
import 'package:bonemeal_runner/src/asset/writer.dart';
import 'package:glob/glob.dart';
import 'package:bonemeal_core/bonemeal_core.dart';

class BuildContextImpl extends BuildContext {
  final AssetReader _reader;
  final RunnerAssetWriter _writer;

  BuildContextImpl({
    required super.source,
    required AssetReader reader,
    required RunnerAssetWriter writer,
  })  : _reader = RelativePathReader(reader, root),
        _writer = RelativePathWriter(writer, root);

  /// [newRoot] will be defined as the new buildContext source root
  @override
  BuildContext createChildContext({String? newRoot}) => BuildContextImpl(
        source: newRoot != null ? source.append(newRoot) : source,
        reader: _reader,
        writer: _writer,
      );

  @override
  Future<void> ipr(String path, String content, {Encoding encoding = utf8}) =>
      writeAsString(AssetId.ipr(path), content, encoding: encoding);

  @override
  Future<void> output(String path, String content,
          {Encoding encoding = utf8}) =>
      writeAsString(AssetId.output(path), content, encoding: encoding);

  @override
  FutureOr<void> buildMetaObjectFromSlot(MetaObjectSlot slot) async {
    final constructed = await slot.construct(this);
    return constructed.object.build(
      constructed.context,
      constructed.data,
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
      _writer.writeAsBytes(id, bytes);

  @override
  Future<void> writeAsString(AssetId id, String content,
          {Encoding encoding = utf8}) =>
      _writer.writeAsString(id, content, encoding: encoding);

  BuildContextImpl.child(
    BuildContextImpl parent, {
    AssetId? newSource,
  })  : _reader = RelativePathReader(reader, root),
        _writer = RelativePathWriter(writer, root);
}
