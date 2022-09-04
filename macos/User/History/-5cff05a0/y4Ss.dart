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
/// Any existing MetaObjects which match a key in [appliesMetaObjects] will
/// automatically be applied to any target which runs this MetaObject, whether
/// because it matches [filter] or because it was enabled manually.
MetaObjectApplication applyMetaObject(
  String metaObjectKey,
  List<MetaObjectFactory> metaObjectFactories, {
  MetaObjectOptions defaultOptions = MetaObjectOptions.empty,
  MetaObjectOptions? defaultDevOptions,
  MetaObjectOptions? defaultReleaseOptions,
  Iterable<String> appliesMetaObjects = const [],
}) =>
    MetaObjectApplication(
      metaObjectKey,
      metaObjectFactories,
      defaultOptions: defaultOptions,
      defaultDevOptions: defaultDevOptions,
      defaultReleaseOptions: defaultReleaseOptions,
    );

/// A description of which packages need a given [MetaObject] or applied.
class MetaObjectApplication {
  /// A uniqe key for this metaObject.
  ///
  /// Ignored when null or empty.
  final String metaObjectKey;

  /// Factories that create [BuildPhase]s for all [MetaObject]s or
  /// [PostProcessMetaObject]s that should be applied.
  final List<MetaObjectFactory> metaObjectFactory;

  /// Whether inputs assets should hidden to subsequent metaObjects.
  final bool defaultConsumeInputs;

  /// Whether generated assets should hidden to subsequent metaObjects.
  final bool defaultHideOutputs;

  final InputSet defaultGenerateFor;

  final MetaObjectOptions defaultOptions;

  final MetaObjectOptions? defaultDevOptions;

  final MetaObjectOptions? defaultReleaseOptions;

  const MetaObjectApplication(
    this.metaObjectKey,
    this.metaObjectFactory, {
    this.defaultHideOutputs = false,
    this.defaultConsumeInputs = false,
    this.defaultGenerateFor = const InputSet(),
    this.defaultOptions = MetaObjectOptions.empty,
    this.defaultDevOptions,
    this.defaultReleaseOptions,
  });

  MetaObject apply({
    required GlobalBonemealConfig rootConfig,
    bool isReleaseBuild = false,
  }) {
    final configOverrides = rootConfig.metaObjects[metaObjectKey];

    final rootMetaObjectOptions = configOverrides != null
        ? MetaObjectOptions(configOverrides.options, isRoot: true)
        : null;

    final rootMetaObjectDevOptions = configOverrides != null
        ? MetaObjectOptions(configOverrides.devOptions, isRoot: true)
        : null;

    final rootMetaObjectReleaseOptions = configOverrides != null
        ? MetaObjectOptions(configOverrides.releaseOptions, isRoot: true)
        : null;

    var optionsWithDefaults = defaultOptions
        .overrideWith(
            isReleaseBuild ? defaultReleaseOptions : defaultDevOptions)
        .overrideWith(rootMetaObjectOptions)
        .overrideWith(isReleaseBuild
            ? rootMetaObjectReleaseOptions
            : rootMetaObjectDevOptions);

    final logger = Logger(metaObjectKey);
    final metaObject =
        _scopeLogSync(() => metaObjectFactory(optionsWithDefaults), logger);
    if (metaObject == null) throw CannotBuildException();
    // _validateMetaObject(metaObject);
    return BuildPhase(
      metaObject: metaObject,
      metaObjectKey: metaObjectKey,
      generateFor: generateFor,
      metaObjectOptions: optionsWithDefaults,
      consumeInputs: consumeInputs,
      hideOutput: hideOutputs,
    );
  }

  @override
  String toString() => '''
MetaObject Application: 
  metaObjectKey: $metaObjectKey
  metaObjectFactories: $metaObjectFactory
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
