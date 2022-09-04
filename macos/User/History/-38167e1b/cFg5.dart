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

/// A description of which packages need a given [Generator] or applied.
class GeneratorApplication {
  /// A uniqe key for this generator.
  ///
  /// Ignored when null or empty.
  final String generatorKey;

  /// Factories that create [BuildPhase]s for all [Generator]s or
  /// [PostProcessGenerator]s that should be applied.
  final List<GeneratorFactory> generatorFactories;

  /// Whether inputs assets should hidden to subsequent generators.
  final bool consumeInputs;

  /// Whether generated assets should hidden to subsequent generators.
  final bool hideOutputs;

  final InputSet defaultGenerateFor;

  final GeneratorOptions defaultOptions;

  final GeneratorOptions? defaultDevOptions;

  final GeneratorOptions? defaultReleaseOptions;

  const GeneratorApplication(
    this.generatorKey,
    this.generatorFactories, {
    this.hideOutputs = false,
    this.consumeInputs = false,
    this.defaultGenerateFor = const InputSet(),
    this.defaultOptions = GeneratorOptions.empty,
    this.defaultDevOptions,
    this.defaultReleaseOptions,
  });

  apply(GeneratorOptions optionOverrides, bool isReleaseBuild) {
    return generatorFactories.map((generatorFactory) {
      return (PackageNode package, GeneratorOptions options,
          InputSet? generateFor, bool isReleaseBuild) {
        generateFor ??= defaultGenerateFor;

        var optionsWithDefaults = defaultOptions
            .overrideWith(
                isReleaseBuild ? defaultReleaseOptions : defaultDevOptions)
            .overrideWith(options);
        if (package.isRoot) {
          optionsWithDefaults =
              optionsWithDefaults.overrideWith(GeneratorOptions.forRoot);
        }

        final logger = Logger(generatorKey);
        final generator =
            _scopeLogSync(() => generatorFactory(optionsWithDefaults), logger);
        if (generator == null) throw CannotBuildException();
        // _validateGenerator(generator);
        return InBuildPhase(
          generator,
          package.name,
          generatorKey: generatorKey,
          generateFor: generateFor,
          generatorOptions: optionsWithDefaults,
          consumeInputs: consumeInputs,
          hideOutput: hideOutputs,
        );
      };
    }).toList();
  }

  @override
  String toString() => """
Generator Application: 
  generatorKey: $generatorKey
  generatorFactories: $generatorFactories
  hideOutputs: $hideOutputs
  consumeInputs: $consumeInputs
  defaultGenerateFor: $defaultGenerateFor
  defaultOptions: $defaultOptions
  defaultDevOptions: $defaultDevOptions
  defaultReleaseOptions: $defaultReleaseOptions
""";
}

const Symbol logKey = #buildLog;

/// Runs [fn] in an error handling [Zone].
///
/// Any calls to [print] will be logged with `log.info`, and any errors will be
/// logged with `log.severe`.
T? _scopeLogSync<T>(T Function() fn, Logger log) {
  return runZonedGuarded(fn, (e, st) {
    log.severe('', e, st);
  }, zoneSpecification: ZoneSpecification(print: (self, parent, zone, message) {
    log.info(message);
  }), zoneValues: {logKey: log});
}
