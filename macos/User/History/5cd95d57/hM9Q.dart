import 'package:bonemeal_core/src/generate/generate.dart';
import 'package:bonemeal_core/src/generator/generator.dart';
import 'package:bonemeal_core/src/environment/build_environment.dart';
import 'package:bonemeal_core/src/asset_graph/asset_graph.dart';
import 'package:bonemeal_core/src/package_graph/package_graph.dart';

class BuildDefinition {
  // final AssetGraph assetGraph;
  final TargetGraph targetGraph;

  // final PackageGraph packageGraph;

  BuildDefinition._({
    required this.targetGraph,
  });

  static Future<BuildDefinition> prepareWorkspace(
    BuildEnvironment environment,
    BuildOptions options,
  ) async {}
}

class _Loader {
  Future<BuildDefinition> prepareWorkspace(
    BuildEnvironment environment,
    BuildOptions options,
  ) async {
    late final TargetGraph targetGraph;
    return BuildDefinition._(
      targetGraph: options.targetGraph,
    );
  }
}
