// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:bonemeal/bonemeal.dart';
// TODO: Move `scopeLogSync` to package:build?
// ignore: implementation_imports
import 'package:bonemeal_runner/src/logging/logging.dart';
import 'package:bonemeal_config/bonemeal_config.dart';
import 'package:graphs/graphs.dart';
import 'package:logging/logging.dart';
import '../generate/exceptions.dart';

import 'package:bonemeal_runner/src/generate/exceptions.dart';
import 'package_graph.dart';

typedef BuildPhaseFactory = BuildPhase Function(
    PackageNode package,
    BuilderOptions options,
    InputSet targetSources,
    InputSet? generateFor,
    bool isReleaseBuild);

typedef PackageFilter = bool Function(PackageNode node);

/// Run a builder on all packages in the package graph.
PackageFilter toAllPackages() => (_) => true;

/// Require manual configuration to opt in to a builder.
PackageFilter toNoneByDefault() => (_) => false;

/// Run a builder on all packages with an immediate dependency on [packageName].
PackageFilter toDependentsOf(String packageName) =>
    (p) => p.dependencies.any((d) => d.name == packageName);

/// Run a builder on a single package.
PackageFilter toPackage(String package) => (p) => p.name == package;

/// Run a builder on a collection of packages.
PackageFilter toPackages(Set<String> packages) =>
    (p) => packages.contains(p.name);

/// Run a builders if the package matches any of [filters]
PackageFilter toAll(Iterable<PackageFilter> filters) =>
    (p) => filters.any((f) => f(p));

PackageFilter toRoot() => (p) => p.isRoot;

/// Apply [builder] to the root package.
///
/// Creates a `BuilderApplication` which corresponds to an empty builder key so
/// that no other `build.yaml` based configuration will apply.
BuilderApplication applyToRoot(Generator builder,
        {bool isOptional = false,
        bool hideOutput = false,
        InputSet generateFor = const InputSet()}) =>
    BuilderApplication.forBuilder('', [(_) => builder], toRoot(),
        isOptional: isOptional,
        hideOutput: hideOutput,
        defaultGenerateFor: generateFor);

/// Apply each builder from [builderFactories] to the packages matching
/// [filter].
///
/// If the builder should only run on a subset of files within a target pass
/// globs to [defaultGenerateFor]. This can be overridden by any target which
/// configured the builder manually.
///
/// If [isOptional] is true the builder will only run if one of its outputs is
/// read by a later builder, or is used as a primary input to a later builder.
/// If no build actions read the output of an optional action, then it will
/// never run.
///
/// Any existing Builders which match a key in [appliesBuilders] will
/// automatically be applied to any target which runs this Builder, whether
/// because it matches [filter] or because it was enabled manually.
BuilderApplication apply(String builderKey,
        List<BuilderFactory> builderFactories, PackageFilter filter,
        {bool isOptional = false,
        bool hideOutput = true,
        InputSet defaultGenerateFor = const InputSet(),
        GeneratorOptions defaultOptions = GeneratorOptions.empty,
        GeneratorOptions? defaultDevOptions,
        GeneratorOptions? defaultReleaseOptions,
        Iterable<String> appliesBuilders = const []}) =>
    BuilderApplication.forBuilder(
      builderKey,
      builderFactories,
      filter,
      isOptional: isOptional,
      hideOutput: hideOutput,
      defaultGenerateFor: defaultGenerateFor,
      defaultOptions: defaultOptions,
      defaultDevOptions: defaultDevOptions,
      defaultReleaseOptions: defaultReleaseOptions,
      appliesBuilders: appliesBuilders,
    );

/// A description of which packages need a given [Builder] or
/// [PostProcessBuilder] applied.
class BuilderApplication {
  /// Factories that create [BuildPhase]s for all [Builder]s or
  /// [PostProcessBuilder]s that should be applied.
  final List<BuildPhaseFactory> buildPhaseFactories;

  /// Determines whether a given package needs builder applied.
  final PackageFilter filter;

  /// Builder keys which, when applied to a target, will also apply this Builder
  /// even if [filter] does not match.
  final Iterable<String> appliesBuilders;

  /// A uniqe key for this builder.
  ///
  /// Ignored when null or empty.
  final String builderKey;

  /// Whether genereated assets should be placed in the build cache.
  final bool hideOutput;

  const BuilderApplication._(
    this.builderKey,
    this.buildPhaseFactories,
    this.filter,
    this.hideOutput,
    this.appliesBuilders,
  );

  factory BuilderApplication.forBuilder(
    String builderKey,
    List<BuilderFactory> builderFactories,
    PackageFilter filter, {
    bool isOptional = false,
    bool hideOutput = true,
    InputSet defaultGenerateFor = const InputSet(),
    GeneratorOptions defaultOptions = GeneratorOptions.empty,
    GeneratorOptions? defaultDevOptions,
    GeneratorOptions? defaultReleaseOptions,
    Iterable<String> appliesBuilders = const [],
  }) {
    var phaseFactories = builderFactories.map((builderFactory) {
      return (PackageNode package, GeneratorOptions options,
          InputSet targetSources, InputSet? generateFor, bool isReleaseBuild) {
        generateFor ??= defaultGenerateFor;

        var optionsWithDefaults = defaultOptions
            .overrideWith(
                isReleaseBuild ? defaultReleaseOptions : defaultDevOptions)
            .overrideWith(options);
        if (package.isRoot) {
          optionsWithDefaults =
              optionsWithDefaults.overrideWith(GeneratorOptions.forRoot);
        }

        final logger = Logger(builderKey);
        final builder =
            _scopeLogSync(() => builderFactory(optionsWithDefaults), logger);
        if (builder == null) throw CannotBuildException();
        _validateBuilder(builder);
        return InBuildPhase(builder, package.name,
            builderKey: builderKey,
            targetSources: targetSources,
            generateFor: generateFor,
            builderOptions: optionsWithDefaults,
            hideOutput: hideOutput,
            isOptional: isOptional);
      };
    }).toList();
    return BuilderApplication._(
        builderKey, phaseFactories, filter, hideOutput, appliesBuilders);
  }
}

final _logger = Logger('ApplyBuilders');

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

void _validateBuilder(Generator builder) {
  var inputExtensions = builder.buildExtensions.keys.toSet();
  var matching = inputExtensions.intersection(
      {for (var outputs in builder.buildExtensions.values) ...outputs});
  if (matching.isNotEmpty) {
    var mapDescription = builder.buildExtensions.entries
        .map((e) => '${e.key}: ${e.value},')
        .join('\n');
    throw ArgumentError.value(
        '{ $mapDescription }',
        '${builder.runtimeType}.buildExtensions',
        'Output extensions must not match any input extensions, but got '
            'the following overlapping output extensions: $matching');
  }
}
