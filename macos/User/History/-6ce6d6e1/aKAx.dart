// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_config/bonemeal_config.dart';
import 'package:bonemeal_runner/src/asset/build_cache.dart';
import 'package:bonemeal_runner/src/asset/in_memory.dart';
import 'package:bonemeal_runner/src/asset_graph/graph.dart';
import 'package:bonemeal_runner/src/environment/build_environment.dart';
import 'package:bonemeal_runner/src/generate/phase.dart';
import 'package:bonemeal_runner/src/generator/build_step_impl.dart';
import 'package:bonemeal_runner/src/package_graph/apply_generators.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';
import 'package:file/memory.dart';
import 'package:glob/glob.dart';
import 'package:logging/logging.dart';

import 'build_result.dart';

import 'options.dart';

final _logger = Logger('Build');

class BuildImpl {
  static Future<BuildImpl> create(
    BuildOptions options,
    BuildEnvironment environment,
    List<GeneratorApplication> generators, {
    bool isReleaseBuild = false,
  }) async {
    return BuildImpl._(options, environment, generators, isReleaseBuild);
  }

  final BuildOptions _options;
  final BuildEnvironment _environment;
  final List<GeneratorApplication> _generators;
  final bool _isReleaseBuild;

  Future<void> beforeExit() async {}

  Future<BuildResult> run() async {
    final phases = _constructBuildPhases();
    final sources = await _findInitialSources();
    final assetGraph = AssetGraph.fromSources(sources);
    final cacheFileSystem = MemoryFileSystem();
    final reader = BuildCacheAssetReader(
      assetGraph: assetGraph,
      reader: InMemoryAssetReader(cacheFileSystem),
    );
    final writer = BuildCacheAssetWriter(
      assetGraph: assetGraph,
      writer: InMemoryAssetWriter(cacheFileSystem),
    );
    await _populateBuildCache(writer, sources);

    _runPhases(
      phases: phases,
      assetGraph: assetGraph,
      reader: reader,
      writer: writer,
    );

    throw UnimplementedError();
  }

  Future<Set<AssetId>> _findInitialSources() async {
    final Set<AssetId> assets = {};
    final filteredPackages = _options.packageGraph.allPackages.entries.where(
      (entry) => _shouldRunOnPackage(entry.value),
    );
    for (final entry in filteredPackages) {
      assets.addAll(await _environment.reader
          .findAssets(Glob('lib/**'), package: entry.key)
          .toList());
    }
    return assets;
  }

  bool _shouldRunOnPackage(PackageNode package) {
    for (final generator in _generators) {
      if (generator.filter(package)) return true;
    }
    return false;
  }

  List<InBuildPhase> _constructBuildPhases() {
    final phases = <InBuildPhase>[];
    for (final package in _options.packageGraph.allPackages.values) {
      for (final generator in _generators) {
        if (generator.filter(package)) {
          phases.addAll(_constructApplicationBuildPhases(generator, package));
        }
      }
    }
    return phases;
  }

  List<InBuildPhase> _constructApplicationBuildPhases(
    GeneratorApplication application,
    PackageNode package,
  ) {
    final phases = <InBuildPhase>[];
    for (final phaseFactory in application.buildPhaseFactories) {
      final generatorConfig = _options
          .bonemealConfig.globalConfig.generators[application.generatorKey];
      final options = _findGeneratorOptions(generatorConfig);

      final phase = phaseFactory(
        package,
        options,
        generatorConfig?.generateFor,
        _isReleaseBuild,
      );

      if (phase is InBuildPhase) {
        phases.add(phase);
      }
    }
    return phases;
  }

  GeneratorOptions _findGeneratorOptions(GeneratorConfig? generatorConfig) {
    late final GeneratorOptions options;
    if (generatorConfig != null) {
      options = GeneratorOptions(generatorConfig.options)
        ..overrideWith(GeneratorOptions(_isReleaseBuild
            ? generatorConfig.releaseOptions
            : generatorConfig.devOptions));
    } else {
      options = GeneratorOptions.empty;
    }
    return options;
  }

  Future<void> _populateBuildCache(
      BuildCacheAssetWriter writer, Set<AssetId> sources) async {
    for (final source in sources) {
      final content = await _environment.reader.readAsString(source);
      await writer.writeAsString(source, content);
    }
  }

  void _runPhases({
    required List<InBuildPhase> phases,
    required AssetGraph assetGraph,
    required BuildCacheAssetReader reader,
    required BuildCacheAssetWriter writer,
  }) {
    for (final phase in phases) {
      final generatorInputs = assetGraph.getAllMatches(phase.generateFor);
      final buildStep = BuildStepImpl(
        inputs: generatorInputs,
        reader: reader,
      );
      _logger.info("Running phase ${phase.identity}");
    }
  }

  BuildImpl._(
    this._options,
    this._environment,
    this._generators,
    this._isReleaseBuild,
  );
}
