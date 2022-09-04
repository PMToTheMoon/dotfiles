import 'package:bonemeal_core/src/environment/build_environment.dart';
import 'package:bonemeal_core/src/package_graph/target_graph.dart';

import 'options.dart';

class BuildDefinition {
  // final AssetGraph assetGraph;
  final TargetGraph targetGraph;

  // final PackageGraph packageGraph;

  BuildDefinition._({
    required this.targetGraph,
  });

  // static Future<BuildDefinition> prepareWorkspace(
  //   BuildEnvironment environment,
  //   BuildOptions options,
  // ) async {}
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
