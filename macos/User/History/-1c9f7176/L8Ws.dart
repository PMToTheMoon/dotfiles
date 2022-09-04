import 'package:bonemeal_runner/src/asset/step.dart';
import 'package:bonemeal_runner/src/generate/finalized_assets_view.dart';
import 'package:bonemeal_runner/src/generate/input_matcher.dart';
import 'package:bonemeal_runner/src/generate/phase.dart';
import 'package:bonemeal_runner/src/generator/build_step_impl.dart';
import 'package:bonemeal_runner/src/utils/constants.dart';
import 'package:glob/glob.dart';
import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:path/path.dart' as p;

import 'package:bonemeal_runner/src/asset/build_cache.dart';
import 'package:bonemeal_runner/src/asset_graph/graph.dart';
import 'package:bonemeal_runner/src/environment/build_environment.dart';
import 'package:bonemeal_runner/src/generate/build_options.dart';
import 'package:bonemeal_runner/src/generate/build_result.dart';
import 'package:logging/logging.dart';

final _log = Logger('BuildRunner');

class BuildRunner {
  static Future<BuildRunner> create({
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
      environment: environment,
      options: options,
      assetGraph: assetGraph,
      buildCacheReader: buildCacheReader,
      buildCacheWriter: buildCacheWriter,
    );
  }

  final BuildEnvironment environment;

  final BuildOptions options;

  final AssetGraph assetGraph;

  final BuildCacheReader buildCacheReader;

  final BuildCacheWriter buildCacheWriter;

  Future<BuildResult> run() async {
    var result = await _runGenerators(phases);

    final finalizedAssetsView = FinalizedAssetsView(assetGraph);

    result = await environment.finalizeBuild(
      result,
      finalizedAssetsView,
      buildCacheReader,
      iprExportDir,
      options.config.target,
    );

    return result;
  }

  Future<BuildResult> _runGenerators(List<BuildPhase> phases) async {
    for (final phase in phases) {
      final inputs = assetGraph.getAllMatches(
        InputMatcher(phase.generateFor),
      );

      late final String outputPackage;
      if (options.config.target != null) {
        final targetPath = p.canonicalize(p.absolute(options.config.target!));
        outputPackage = p.split(targetPath).last;
      } else {
        outputPackage = 'target_undefined';
      }

      final buildStep = BuildStepImpl(
        iprPackage: options.rootPackage.name,
        outputPackage: outputPackage,
        inputs: inputs.map((node) => node.id).toSet(),
        reader: BuildStepReader(buildCacheReader, assetGraph),
        writer: BuildStepWriter(buildCacheWriter, assetGraph),
      );
      try {
        await phase.generator.build(buildStep);
      } catch (e) {
        _log.severe(
          '${phase.generatorKey} encountered an error during build: $e',
        );
      }
    }
    return BuildResult.success();
  }

  const BuildRunner._({
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
