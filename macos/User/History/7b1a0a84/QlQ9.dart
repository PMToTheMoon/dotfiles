import 'dart:convert';

import 'package:bonemeal/bonemeal.dart';
import 'package:file/memory.dart';

/// A Single build step
///
/// Give access to the asset graph, containing sources inputs as well
/// outputs from previously ran generators. A [BuildStep] also provide way to
/// read assets and access to previous generator outputs meta data as well
/// writing to IPR and output
class BuildStepImpl implements BuildStep {
  @override
  final BuildStepIprImpl ipr;

  final BuildStepOutputImpl output;

  BuildStep({
    required AssetReader reader,
    required AssetWriter writer,
  })  : ipr = BuildStepIPR(reader, writer),
        output = BuildStepOutput(reader, writer);
}

class BuildStepIprImpl implements BuildStepIPR {
  final AssetReader _reader;
  final AssetWriter _writer;

  BuildStepIprImpl(
    this._reader,
    this._writer,
  );
}

class BuildStepOutputImpl implements BuildStepOutput {
  final AssetReader _reader;
  final AssetWriter _writer;

  @override
  Future<List<int>> readAsBytes(AssetId id) => _reader.readAsBytes(id);

  @override
  Future<String> readAsString(AssetId id, {Encoding encoding = utf8}) => _reader.readAsString(id, encoding: encoding);

  @override
  Future<bool> canRead(AssetId id) => _reader.canRead(id);

  @override
  Stream<AssetId> findAssets(Glob glob) => _reader.findAssets(glob);

  BuildStepOutputImpl(
    this._reader,
    this._writer,
  );
}
