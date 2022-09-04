import 'package:bonemeal/bonemeal.dart';

/// A Single build step
///
/// Give access to the asset graph, containing sources inputs as well
/// outputs from previously ran generators. A [BuildStep] also provide way to
/// read assets and access to previous generator outputs meta data as well
/// writing to IPR and output
class BuildStep {
  final BuildStepIPR ipr;

  final BuildStepOutput output;

  final InMemoryAssetReader _reader;
  AssetWriter _writer;

  BuildStep()
      : ipr = BuildStepIPR(),
        output = BuildStepOutput();
}

class BuildStepIPR {
  final AssetReader _reader;
  final AssetWriter _writer;
}

class BuildStepOutput {
  final AssetReader _reader;
  final AssetWriter _writer;
}
