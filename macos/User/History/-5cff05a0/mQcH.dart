import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_config/bonemeal_config.dart';
import 'package:logging/logging.dart';

import 'exceptions.dart';
import 'phase.dart';

/// Apply each metaObject from [metaObjectFactories] to the packages matching
/// [filter].
///
/// If the metaObject should only run on a subset of files within a target pass
/// globs to [defaultGenerateFor]. This can be overridden by any target which
/// configured the metaObject manually.
///
/// If [isOptional] is true the metaObject will only run if one of its outputs is
/// read by a later metaObject, or is used as a primary input to a later metaObject.
/// If no build actions read the output of an optional action, then it will
/// never run.
///
/// Any existing Generators which match a key in [appliesGenerators] will
/// automatically be applied to any target which runs this Generator, whether
/// because it matches [filter] or because it was enabled manually.
MetaObjectApplication applyMetaObject(
  String metaObjectKey,
  List<GeneratorFactory> metaObjectFactories, {
  GeneratorOptions defaultOptions = GeneratorOptions.empty,
  GeneratorOptions? defaultDevOptions,
  GeneratorOptions? defaultReleaseOptions,
  Iterable<String> appliesMetaObjects = const [],
}) =>
    MetaObjectApplication(
      metaObjectKey,
      metaObjectFactories,
      defaultConsumeInputs: consumeInputs,
      defaultHideOutputs: hideOutputs,
      defaultGenerateFor: defaultGenerateFor,
      defaultOptions: defaultOptions,
      defaultDevOptions: defaultDevOptions,
      defaultReleaseOptions: defaultReleaseOptions,
    );

/// A description of which packages need a given [Generator] or applied.
class MetaObjectApplication {
  /// A uniqe key for this metaObject.
  ///
  /// Ignored when null or empty.
  final String metaObjectKey;

  /// Factories that create [BuildPhase]s for all [Generator]s or
  /// [PostProcessGenerator]s that should be applied.
  final List<GeneratorFactory> metaObjectFactories;

  /// Whether inputs assets should hidden to subsequent metaObjects.
  final bool defaultConsumeInputs;

  /// Whether generated assets should hidden to subsequent metaObjects.
  final bool defaultHideOutputs;

  final InputSet defaultGenerateFor;

  final GeneratorOptions defaultOptions;

  final GeneratorOptions? defaultDevOptions;

  final GeneratorOptions? defaultReleaseOptions;

  const MetaObjectApplication(
    this.metaObjectKey,
    this.metaObjectFactories, {
    this.defaultHideOutputs = false,
    this.defaultConsumeInputs = false,
    this.defaultGenerateFor = const InputSet(),
    this.defaultOptions = GeneratorOptions.empty,
    this.defaultDevOptions,
    this.defaultReleaseOptions,
  });

  List<BuildPhase> apply({
    required GlobalBonemealConfig rootConfig,
    bool isReleaseBuild = false,
  }) {
    return metaObjectFactories.map((metaObjectFactory) {
      final configOverrides = rootConfig.metaObjects[metaObjectKey];

      final generateFor = configOverrides?.generateFor ?? defaultGenerateFor;

      final rootGeneratorOptions = configOverrides != null
          ? GeneratorOptions(configOverrides.options, isRoot: true)
          : null;

      final rootGeneratorDevOptions = configOverrides != null
          ? GeneratorOptions(configOverrides.devOptions, isRoot: true)
          : null;

      final rootGeneratorReleaseOptions = configOverrides != null
          ? GeneratorOptions(configOverrides.releaseOptions, isRoot: true)
          : null;

      final hideOutputs =
          configOverrides?.hideOutputs ?? this.defaultHideOutputs;

      final consumeInputs =
          configOverrides?.consumeInputs ?? this.defaultConsumeInputs;

      var optionsWithDefaults = defaultOptions
          .overrideWith(
              isReleaseBuild ? defaultReleaseOptions : defaultDevOptions)
          .overrideWith(rootGeneratorOptions)
          .overrideWith(isReleaseBuild
              ? rootGeneratorReleaseOptions
              : rootGeneratorDevOptions);

      final logger = Logger(metaObjectKey);
      final metaObject =
          _scopeLogSync(() => metaObjectFactory(optionsWithDefaults), logger);
      if (metaObject == null) throw CannotBuildException();
      // _validateGenerator(metaObject);
      return BuildPhase(
        metaObject: metaObject,
        metaObjectKey: metaObjectKey,
        generateFor: generateFor,
        metaObjectOptions: optionsWithDefaults,
        consumeInputs: consumeInputs,
        hideOutput: hideOutputs,
      );
    }).toList();
  }

  @override
  String toString() => '''
Generator Application: 
  metaObjectKey: $metaObjectKey
  metaObjectFactories: $metaObjectFactories
  hideOutputs: $defaultHideOutputs
  consumeInputs: $defaultConsumeInputs
  defaultGenerateFor: $defaultGenerateFor
  defaultOptions: $defaultOptions
  defaultDevOptions: $defaultDevOptions
  defaultReleaseOptions: $defaultReleaseOptions
''';
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
