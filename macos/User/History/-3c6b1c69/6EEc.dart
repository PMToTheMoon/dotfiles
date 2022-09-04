import 'package:bonemeal_config/bonemeal_config.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';

class BuildOptions {
  static Future<BuildOptions> create(PackageGraph packageGraph) async {
    final bonemealConfig =
        await BonemealConfig.fromPackageDir(packageGraph.root.path);
    return BuildOptions(config: bonemealConfig);
  }

  final BonemealConfig config;

  const BuildOptions({required this.config});
}
