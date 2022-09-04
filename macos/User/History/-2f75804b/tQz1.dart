import 'package:bonemeal_runner/src/generate/input_matcher.dart';
import 'package:bonemeal_runner/src/generate/phase.dart';
import 'package:bonemeal_runner/src/generator/build_step_impl.dart';
import 'package:glob/glob.dart';
import 'package:bonemeal/bonemeal.dart';

import 'package:bonemeal_runner/src/asset/build_cache.dart';
import 'package:bonemeal_runner/src/asset_graph/graph.dart';
import 'package:bonemeal_runner/src/environment/build_environment.dart';
import 'package:bonemeal_runner/src/generate/build_options.dart';
import 'package:bonemeal_runner/src/generate/build_result.dart';
import 'package:bonemeal_runner/src/generate/apply_generators.dart';

class BuildRunner {
  static Future<BuildRunner> create(
    List<GeneratorApplication> generators, {
    required BuildEnvironment environment,
    required BuildOptions options,
  }) async {
    final sources = await _findSources(reader: environment.reader);
    final assetGraph = AssetGraph.fromSources(sources);
    final buildCacheWriter = BuildCacheWriter(
      environment.writer,
      assetGraph,
    );

    return BuildRunner._(
      generators,
      environment: environment,
      options: options,
      buildCacheWriter: buildCacheWriter,
    );
  }

  final List<GeneratorApplication> generators;

  final BuildEnvironment environment;

  final BuildOptions options;

  final BuildCacheWriter buildCacheWriter;

  final BuildCacheWriter buildCacheReader;

  Future<BuildResult> run() async {
    final sources = await _findSources(reader: environment.reader);
    final assetGraph = AssetGraph.fromSources(sources);
    final phases = _constructBuildPhases();
    final result = await _runGenerators(assetGraph, phases);

    // await environment.finalizeBuild(
    //   result,
    //   finalizedAssetsView,
    //   assetReader,
    //   iprDir,
    //   outputDir,
    // );

    throw UnimplementedError();
  }

  List<BuildPhase> _constructBuildPhases() {
    return generators
        .map((generator) => generator.apply(
              rootConfig: options.config.globalConfig,
              isReleaseBuild: options.isReleaseBuild,
            ))
        .expand((e) => e)
        .toList();
  }

  Future<BuildResult> _runGenerators({
    required AssetGraph assetGraph,
    required List<BuildPhase> phases,
    required AssetWriter reader,
    required AssetWriter writer,
  }) async {
    for (final phase in phases) {
      final assets = assetGraph.getAllMatches(
        InputMatcher(phase.generateFor),
      );
      final builStep = BuildStepImpl(
        reader: environment.reader,
        writer: writer,
      );
      await phase.generator.build();
    }
    return BuildResult.success();
  }

  const BuildRunner._(
    this.generators, {
    required this.environment,
    required this.options,
    required this.buildCacheWriter,
  });
}

Future<Set<AssetId>> _findSources({
  required AssetReader reader,
}) async {
  return await reader.findAssets(Glob('lib/**')).toSet();
}
