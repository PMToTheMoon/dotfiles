import 'package:bonemeal_core/src/generator/generator.dart';
import 'package:bonemeal_core/src/environment/build_environment.dart';
import 'package:bonemeal_core/src/asset/asset.dart';
import 'package:bonemeal_core/src/asset_graph/asset_graph.dart';

class BuildDefinition {
  final AssetGraph assetGraph;
  final TargetGraph targetGraph;

  final AssetReader reader;
  final RunnerAssetWriter writer;

  final PackageGraph packageGraph;

  static Future<BuildDefinition> prepareWorkspace(
    BuildEnvironment environment,
    GeneratorOptions options,
  ) {}
}
