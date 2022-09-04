import 'dart:async';

import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_config/bonemeal_config.dart';
import 'package:logging/logging.dart';

/// Apply each generator from [generatorFactories] to the packages matching
/// [filter].
///
/// If the generator should only run on a subset of files within a target pass
/// globs to [defaultGenerateFor]. This can be overridden by any target which
/// configured the generator manually.
///
/// If [isOptional] is true the generator will only run if one of its outputs is
/// read by a later generator, or is used as a primary input to a later generator.
/// If no build actions read the output of an optional action, then it will
/// never run.
///
/// Any existing Generators which match a key in [appliesGenerators] will
/// automatically be applied to any target which runs this Generator, whether
/// because it matches [filter] or because it was enabled manually.
GeneratorApplication apply(
  String generatorKey,
  List<GeneratorFactory> generatorFactories, {
  bool isOptional = false,
  bool consumeInputs = false,
  bool hideOutputs = false,
  InputSet defaultGenerateFor = const InputSet(),
  GeneratorOptions defaultOptions = GeneratorOptions.empty,
  GeneratorOptions? defaultDevOptions,
  GeneratorOptions? defaultReleaseOptions,
  Iterable<String> appliesGenerators = const [],
}) =>
    GeneratorApplication(
      generatorKey,
      generatorFactories,
      consumeInputs: consumeInputs,
      hideOutputs: hideOutputs,
      defaultGenerateFor: defaultGenerateFor,
      defaultOptions: defaultOptions,
      defaultDevOptions: defaultDevOptions,
      defaultReleaseOptions: defaultReleaseOptions,
    );
