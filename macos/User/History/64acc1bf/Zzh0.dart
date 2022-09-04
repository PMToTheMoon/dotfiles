import 'dart:async';

import 'package:bonemeal/bonemeal.dart';
import 'package:logging/logging.dart';
import 'package:bonemeal_runner/src/generate/exceptions.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';

typedef BuildPhaseFactory = BuildPhase Function(GeneratorOptions options,
    InputSet targetSources, InputSet? generateFor, bool isReleaseBuild);

List<BuildPhaseFactory> buildGenerators(
  String generatorKey,
  List<GeneratorFactory> builderFactories,
  PackageFilter filter, {
  InputSet defaultGenerateFor = const InputSet(),
  GeneratorOptions defaultOptions = GeneratorOptions.empty,
  GeneratorOptions? defaultDevOptions,
  GeneratorOptions? defaultReleaseOptions,
  Iterable<String> appliesBuilders = const [],
}) {
  var buildPhaseFactories = builderFactories
      .map((builderFactory) => (
            PackageNode package,
            GeneratorOptions options,
            bool isReleaseBuild,
          ) {
            var optionsWithDefaults = defaultOptions
                .overrideWith(
                    isReleaseBuild ? defaultReleaseOptions : defaultDevOptions)
                .overrideWith(options);
            if (package.isRoot) {
              optionsWithDefaults =
                  optionsWithDefaults.overrideWith(GeneratorOptions.forRoot);
            }

            final logger = Logger(generatorKey);
            final Generator? generator = _scopeLogSync(
                () => builderFactory(optionsWithDefaults), logger);
            if (generator == null) throw CannotBuildException();
            return generator;
          })
      .toList();
  return buildPhaseFactories;
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
