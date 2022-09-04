import 'dart:async';

import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_config/bonemeal_config.dart';
import 'package:bonemeal_runner/src/generate/exceptions.dart';
import 'package:bonemeal_runner/src/generate/phase.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';
import 'package:logging/logging.dart';

typedef PackageFilter = bool Function(PackageNode node);

/// Run a generator on all packages in the package graph.
PackageFilter toAllPackages() => (_) => true;

/// Require manual configuration to opt in to a generator.
PackageFilter toNoneByDefault() => (_) => false;

/// Run a generator on all packages with an immediate dependency on [packageName].
PackageFilter toDependentsOf(String packageName) =>
    (p) => p.dependencies.any((d) => d.name == packageName);

/// Run a generator on a single package.
PackageFilter toPackage(String package) => (p) => p.name == package;

/// Run a generator on a collection of packages.
PackageFilter toPackages(Set<String> packages) =>
    (p) => packages.contains(p.name);

/// Run a generators if the package matches any of [filters]
PackageFilter toAll(Iterable<PackageFilter> filters) =>
    (p) => filters.any((f) => f(p));

PackageFilter toRoot() => (p) => p.isRoot;

/// [package] is used to know if current
/// package is root and to give a name to created build phase
///
/// [overrideOptions] is used to pass custom data to the generator.
/// Doing so overrides data specified in the "default" section of generator
/// config. The only way to override generator default is by specifying
/// overrides the root package's bonemeal.yaml file
///
/// [targetSources] and [generateFor] are used to filter on what asset
/// the generator should run. This props belong to [TargetGraph]
typedef BuildPhaseFactory = BuildPhase Function(
    PackageNode package,
    GeneratorOptions overrideOptions,
    InputSet? generateFor,
    bool isReleaseBuild);

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
GeneratorApplication apply(String generatorKey,
        List<GeneratorFactory> generatorFactories, PackageFilter filter,
        {bool isOptional = false,
        bool hideOutput = true,
        InputSet defaultGenerateFor = const InputSet(),
        GeneratorOptions defaultOptions = GeneratorOptions.empty,
        GeneratorOptions? defaultDevOptions,
        GeneratorOptions? defaultReleaseOptions,
        Iterable<String> appliesGenerators = const []}) =>
    GeneratorApplication.forGenerator(
      generatorKey,
      generatorFactories,
      filter,
      isOptional: isOptional,
      hideOutput: hideOutput,
      defaultGenerateFor: defaultGenerateFor,
      defaultOptions: defaultOptions,
      defaultDevOptions: defaultDevOptions,
      defaultReleaseOptions: defaultReleaseOptions,
      appliesGenerators: appliesGenerators,
    );

/// A description of which packages need a given [Generator] or
/// [PostProcessGenerator] applied.
class GeneratorApplication {
  /// Factories that create [BuildPhase]s for all [Generator]s or
  /// [PostProcessGenerator]s that should be applied.
  final List<BuildPhaseFactory> buildPhaseFactories;

  /// Determines whether a given package needs generator applied.
  final PackageFilter filter;

  /// Generator keys which, when applied to a target, will also apply this Generator
  /// even if [filter] does not match.
  final Iterable<String> appliesGenerators;

  /// A uniqe key for this generator.
  ///
  /// Ignored when null or empty.
  final String generatorKey;

  /// Whether inputs assets should hidden to subsequent generators.
  final bool consumeInputs;

  /// Whether generated assets should hidden to subsequent generators.
  final bool hideOutput;

  const GeneratorApplication._(
    this.generatorKey,
    this.buildPhaseFactories,
    this.filter,
    this.hideOutput,
    this.appliesGenerators,
  );

  factory GeneratorApplication.forGenerator(
    String generatorKey,
    List<GeneratorFactory> generatorFactories,
    PackageFilter filter, {
    bool isOptional = false,
    bool hideOutput = false,
    bool consumeInputs = false,
    InputSet defaultGenerateFor = const InputSet(),
    GeneratorOptions defaultOptions = GeneratorOptions.empty,
    GeneratorOptions? defaultDevOptions,
    GeneratorOptions? defaultReleaseOptions,
    Iterable<String> appliesGenerators = const [],
  }) {
    var phaseFactories = generatorFactories.map((generatorFactory) {
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
        return InBuildPhase(generator, package.name,
            generatorKey: generatorKey,
            generateFor: generateFor,
            generatorOptions: optionsWithDefaults,
            hideOutput: hideOutput,
            isOptional: isOptional);
      };
    }).toList();
    return GeneratorApplication._(
        generatorKey, phaseFactories, filter, hideOutput, appliesGenerators);
  }
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
