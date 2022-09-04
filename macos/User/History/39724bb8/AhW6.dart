import 'package:bonemeal/bonemeal.dart';

/// A Single build step
///
/// Give access to a set of inputs. Provide way to
/// read assets and access to previous generator outputs meta data as well
/// writing to IPR and output
abstract class BuildStep {
  BuildStepIPR get ipr;

  BuildStepOutput get output;
}

abstract class BuildStepIPR implements AssetReader, AssetWriter {}

abstract class BuildStepOutput implements AssetReader, AssetWriter {}
