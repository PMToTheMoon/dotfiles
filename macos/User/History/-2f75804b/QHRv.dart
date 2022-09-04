import 'package:bonemeal_runner/src/asset/step.dart';
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

    final buildCacheReader = BuildCacheReader(
      environment.reader,
      assetGraph,
    );
    final buildCacheWriter = BuildCacheWriter(
      environment.writer,
      assetGraph,
    );

    return BuildRunner._(
      generators,
      environment: environment,
      options: options,
      assetGraph: assetGraph,
      buildCacheReader: buildCacheReader,
      buildCacheWriter: buildCacheWriter,
    );
  }

  final List<GeneratorApplication> generators;

  final BuildEnvironment environment;

  final BuildOptions options;

  final AssetGraph assetGraph;

  final BuildCacheReader buildCacheReader;

  final BuildCacheWriter buildCacheWriter;

  Future<BuildResult> run() async {
    final phases = _constructBuildPhases();
    final result = await _runGenerators(phases);

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

  Future<BuildResult> _runGenerators(List<BuildPhase> phases) async {
    for (final phase in phases) {
      final inputs = assetGraph.getAllMatches(
        InputMatcher(phase.generateFor),
      );

      final buildStep = BuildStepImpl(
        inputs: inputs.map((node) => node.id).toSet(),
        reader: buildCacheReader,
        writer: buildCacheWriter,
      );
      await phase.generator.build(buildStep);
    }
    return BuildResult.success();
  }

  const BuildRunner._(
    this.generators, {
    required this.environment,
    required this.options,
    required this.assetGraph,
    required this.buildCacheReader,
    required this.buildCacheWriter,
  });
}

Future<Set<AssetId>> _findSources({
  required AssetReader reader,
}) async {
  return await reader.findAssets(Glob('lib/**')).toSet();
}
