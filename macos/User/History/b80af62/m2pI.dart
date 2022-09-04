import 'package:bonemeal_config/bonemeal_config.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';

class BuildOptions {
  static Future<BuildOptions> create(PackageGraph packageGraph) async {
    final bonemealConfig =
        await BonemealConfig.fromBuildConfigDir(packageGraph.root.path);
    return BuildOptions(
      rootPackage: packageGraph.root,
      config: bonemealConfig,
    );
  }

  final PackageNode rootPackage;

  final BonemealConfig config;

  const BuildOptions({
    required this.rootPackage,
    required this.config,
    bool? isReleaseBuild,
  });
}
