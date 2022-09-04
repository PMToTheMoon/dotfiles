import 'package:bonemeal/bonemeal.dart';
import 'package:file/memory.dart';

/// A Single build step
///
/// Give access to the asset graph, containing sources inputs as well
/// outputs from previously ran generators. A [BuildStep] also provide way to
/// read assets and access to previous generator outputs meta data as well
/// writing to IPR and output
abstract class BuildStep {
  BuildStepIPR get ipr;

  BuildStepOutput get output;
}

abstract class BuildStepIPR implements AssetReader, AssetWriter {}

abstract class BuildStepOutput implements AssetReader, AssetWriter {}
