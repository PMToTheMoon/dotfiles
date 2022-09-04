import 'package:bonemeal/bonemeal.dart';
import 'package:file/memory.dart';

/// A Single build step
///
/// Give access to the asset graph, containing sources inputs as well
/// outputs from previously ran generators. A [BuildStep] also provide way to
/// read assets and access to previous generator outputs meta data as well
/// writing to IPR and output
class BuildStep {
  final BuildStepIPR ipr;

  final BuildStepOutput output;

  final MemoryFileSystem _outputFS;

  BuildStep({
    required AssetReader reader,
  })  : ipr = BuildStepIPR(reader, InMemoryAssetWriter(_outputFS)),
        output = BuildStepOutput(reader, writer);
}

class BuildStepIPR {
  final AssetReader _reader;
  final AssetWriter _writer;

  BuildStepIPR(
    this._reader,
    this._writer,
  );
}

class BuildStepOutput {
  final AssetReader _reader;
  final AssetWriter _writer;

  BuildStepOutput(
    this._reader,
    this._writer,
  );
}
