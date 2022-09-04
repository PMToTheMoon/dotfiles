import 'package:bonemeal_runner/src/generate/build_result.dart';
import 'package:bonemeal_runner/src/generate/options.dart';
import 'package:bonemeal_runner/src/package_graph/apply_generators.dart';
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

  _runGenerators(
    generators,
    packageGraph: packageGraph,
  );

  return BuildResult(BuildStatus.success, []);
}

void _runGenerators(
  List<GeneratorApplication> generators, {
  required PackageGraph packageGraph,
}) {
  for (final package in packageGraph.allPackages.values) {
    for (final generator in generators) {
      if (generator.filter(package)) {
        _runGeneratorForPackage(generator, package);
      }
    }
  }
}

void _runGeneratorForPackage(
  GeneratorApplication application,
  PackageNode package,
) {
  for (final phaseFactory in application.buildPhaseFactories) {
    // phaseFactory(
    //   package,
    //   //find options override
    // );
  }
}
