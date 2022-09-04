import 'dart:convert';

import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/src/asset/in_memory.dart';
import 'package:crypto/crypto.dart';
import 'package:file/memory.dart';
import 'package:glob/glob.dart';

/// Implementation of build step
///
/// take the asset reader from the previous step.
/// write files to a separated in-memory filesystem.
/// when build step is completed, previous and current build step
/// should be merged together to get the next step inputs.
class BuildStepImpl extends BuildStep {
  @override
  final BuildStepIprImpl ipr;

  @override
  final BuildStepOutputImpl output;

  /// Create a [BuildStepImpl] with its own in-memory filesystem for
  /// every written files
  factory BuildStepImpl({
    required Set<AssetId> inputs,
    required AssetReader reader,
  }) {
    final writer = InMemoryAssetWriter(MemoryFileSystem());
    return BuildStepImpl._(
      inputs: inputs,
      reader: reader,
      writer: writer,
    );
  }

  BuildStepImpl._({
    required super.inputs,
    required AssetReader reader,
    required InMemoryAssetWriter writer,
  })  : ipr = BuildStepIprImpl(reader, writer),
        output = BuildStepOutputImpl(reader, writer);
}

class BuildStepIprImpl implements BuildStepIPR {
  final AssetReader _reader;
  final AssetWriter _writer;

  BuildStepIprImpl(
    this._reader,
    this._writer,
  );

  @override
  Future<List<int>> readAsBytes(AssetId id) => _reader.readAsBytes(id);

  @override
  Future<String> readAsString(AssetId id, {Encoding encoding = utf8}) =>
      _reader.readAsString(id, encoding: encoding);

  @override
  Future<bool> canRead(AssetId id) => _reader.canRead(id);

  @override
  Stream<AssetId> findAssets(Glob glob) => _reader.findAssets(glob);

  @override
  Future<Digest> digest(AssetId id) => _reader.digest(id);

  @override
  Future<void> writeAsBytes(AssetId id, List<int> bytes) =>
      _writer.writeAsBytes(id, bytes);

  @override
  Future<void> writeAsString(AssetId id, String contents,
          {Encoding encoding = utf8}) =>
      _writer.writeAsString(id, contents, encoding: encoding);
}

class BuildStepOutputImpl implements BuildStepOutput {
  final AssetReader _reader;
  final AssetWriter _writer;

  BuildStepOutputImpl(
    this._reader,
    this._writer,
  );

  @override
  Future<List<int>> readAsBytes(AssetId id) => _reader.readAsBytes(id);

  @override
  Future<String> readAsString(AssetId id, {Encoding encoding = utf8}) =>
      _reader.readAsString(id, encoding: encoding);

  @override
  Future<bool> canRead(AssetId id) => _reader.canRead(id);

  @override
  Stream<AssetId> findAssets(Glob glob) => _reader.findAssets(glob);

  @override
  Future<Digest> digest(AssetId id) => _reader.digest(id);

  @override
  Future<void> writeAsBytes(AssetId id, List<int> bytes) =>
      _writer.writeAsBytes(id, bytes);

  @override
  Future<void> writeAsString(AssetId id, String contents,
          {Encoding encoding = utf8}) =>
      _writer.writeAsString(id, contents, encoding: encoding);
}
