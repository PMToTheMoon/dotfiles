import 'dart:async';
import 'dart:convert';

import 'package:bonemeal_core/src/asset/dependency.dart';
import 'package:bonemeal_core/src/asset/id.dart';
import 'package:bonemeal_core/src/asset/reader.dart';
import 'package:bonemeal_core/src/asset/writer.dart';
import 'package:glob/glob.dart';
import 'package:path/path.dart' as p;

import 'meta_object.dart';

class BuildStep extends PathProvidingAssetReader implements AssetWriter {
  BuildStep(
    this._reader,
    this._writer, {
    String? root,
  }) : _root = root ?? '';

  final PathProvidingAssetReader _reader;
  final AssetWriter _writer;

  final String _root;

  SharedAssetId get source => SharedAssetId(
        ipr: AssetId.ipr(_root),
        output: AssetId.output(_root),
      );

  Uri get uri => Uri.parse(_root);

  AssetId ipr(String path) => AssetId.ipr(_contextualizedPath(_root, path));

  AssetId output(String path) =>
      AssetId.output(_contextualizedPath(_root, path));

  Future<AssetId> writeIpr(
    String path,
    String content, [
    List<Dependency>? dependencies,
  ]) async {
    final id = ipr(path);
    content = _appendDependencies(id, content, dependencies);
    await writeAsString(id, content);
    return id;
  }

  Future<AssetId> writeOutput(
    String path,
    String content, [
    Dependencies? dependencies,
  ]) async {
    final id = output(path);
    content = _appendDependencies(id, content, dependencies);
    await writeAsString(id, content);
    return id;
  }

  Future<SharedAssetId> writeShared(
    String path,
    String content, [
    Dependencies? dependencies,
  ]) async {
    return SharedAssetId(
      ipr: await writeIpr(path, content, dependencies),
      output: await writeOutput(path, content, dependencies),
    );
  }

  FutureOr<MetaData> build<MetaData>(MetaObject<MetaData> object) {
    // TODO: more robust nested path (packages, asbolute and relative paths)
    final root = p.join(_root, object.root);
    return object.build(
      BuildStep(
        _reader,
        _writer,
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

String _contextualizedPath(String root, String path) => p.join(root, path);

String _appendDependencies(
  AssetId id,
  String content,
  List<Dependency>? dependencies,
) {
  if (dependencies != null && dependencies.isEmpty == false) {
    return [
      for (final dep in dependencies) dep.resolve(id),
      '\n',
      content,
    ].join('\n');
  } else {
    return content;
  }
}
