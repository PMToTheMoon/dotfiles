import 'dart:async';
import 'dart:convert';

import 'package:bonemeal_runner/src/asset/relative.dart';
import 'package:bonemeal_runner/src/asset/writer.dart';
import 'package:glob/glob.dart';
import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:path/path.dart' as path;

class BuildContextImpl extends BuildContext {
  final PathProvidingAssetReader _reader;
  final RunnerAssetWriter _writer;

  BuildContextImpl({
    required super.iprPackage,
    required super.outputPackage,
    required super.source,
    required AssetReader reader,
    required RunnerAssetWriter writer,
  })  : _reader = RelativePathReader(reader, source.path),
        _writer = RelativePathWriter(writer, source.path);

  BuildContextImpl.child(
    BuildContextImpl parent, {
    String? newSourceRelativePath,
    String? newIprPackage,
    String? newOutputPackage,
  })  : _reader =
            RelativePathReader(parent._reader, newSourceRelativePath ?? ''),
        _writer =
            RelativePathWriter(parent._writer, newSourceRelativePath ?? ''),
        super(
          source: newSourceRelativePath != null
              ? parent.source.append(newSourceRelativePath)
              : parent.source,
          iprPackage: newIprPackage ?? parent.iprPackage,
          outputPackage: newOutputPackage ?? parent.outputPackage,
        ) {
    if (newSourceRelativePath != null &&
        path.equals(
          parent.source.append(newSourceRelativePath).path,
          parent.source.path,
        )) {
      throw ArgumentError(
        'New child context root path [$newSourceRelativePath] redirect to'
        ' the same source than its parent (${parent.source.path})',
      );
    }
  }

  /// [newRoot] will be defined as the new buildContext source root
  @override
  BuildContext createChildContext({String? newRoot}) =>
      BuildContextImpl.child(this, newSourceRelativePath: newRoot);

  @override
  Future<void> ipr(String path, String content, {Encoding encoding = utf8}) =>
      writeAsString(AssetId.ipr(path), content, encoding: encoding);

  @override
  Future<void> output(String path, String content,
          {Encoding encoding = utf8}) =>
      writeAsString(AssetId.output(path), content, encoding: encoding);

  @override
  FutureOr<T> buildMetaObjectFromSlot<T>(MetaObjectSlot slot) async {
    final constructed = await slot.construct(this);
    final metaData = await constructed.object.build(
      constructed.context,
      constructed.data,
    );
    try {
      return metaData as T;
    } catch (e) {
      throw ArgumentError('Expected a result of type $T from meta object '
          'slot but received an object of type ${metaData.runtimeType}.');
    }
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

  @override
  String pathTo(AssetId id) => _reader.pathTo(id);
}
