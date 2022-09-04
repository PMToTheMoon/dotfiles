import 'package:bonemeal_runner/src/generate/build_result.dart';
import 'package:bonemeal_runner/src/generate/options.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';

Future<BuildResult> build(
  List<GeneratorApplication> generators, {
  PackageGraph? packageGraph,
}) async {
  packageGraph ??= await PackageGraph.forThisPackage();

  final options = BuildOptions.create(
    packageGraph: packageGraph,
    overrideBuildConfig: const {},
  );

  return BuildResult(BuildStatus.success, []);
}
