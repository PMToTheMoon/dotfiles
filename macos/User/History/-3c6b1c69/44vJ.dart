import 'package:bonemeal_config/bonemeal_config.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';

class BuildOptions {
  static Future<BuildOptions> create(
    PackageGraph packageGraph, {
    bool? isReleaseBuild,
  }) async {
    final bonemealConfig =
        await BonemealConfig.fromPackageDir(packageGraph.root.path);
    return BuildOptions(config: bonemealConfig, isReleaseBuild: isReleaseBuild);
  }

  final PackageNode rootPackage;

  final BonemealConfig config;

  final bool isReleaseBuild;

  const BuildOptions({
    required this.config,
    bool? isReleaseBuild,
  }) : isReleaseBuild = isReleaseBuild ?? false;
}
