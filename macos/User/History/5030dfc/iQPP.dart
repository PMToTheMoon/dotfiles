import 'package:bonemeal_runner/src/environment/io_environment.dart';
import 'package:bonemeal_runner/src/generate/build_result.dart';
import 'package:bonemeal_runner/src/generate/build_runner.dart';
import 'package:bonemeal_runner/src/generate/options.dart';
import 'package:bonemeal_runner/src/package_graph/apply_generators.dart';
import 'package:bonemeal_runner/src/package_graph/build_config_overrides.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';

Future<BuildResult> build(
  List<GeneratorApplication> generators, {
  PackageGraph? packageGraph,
  bool? assumeTty,
  bool? outputSymlinksOnly,
}) async {
  outputSymlinksOnly ??= false;
  packageGraph ??= await PackageGraph.forThisPackage();

  final environment = IOEnvironment(
    packageGraph,
    assumeTty: assumeTty,
    outputSymlinksOnly: outputSymlinksOnly,
  );

  final options = await BuildOptions.create(
    packageGraph: packageGraph,
  );

  final runner = BuildRunner.create(options, environment, )

  return BuildResult(BuildStatus.success, []);
}

void _runGenerators(
  List<GeneratorApplication> generators,
  PackageGraph packageGraph,
  BuildOptions options,
) {
  for (final package in packageGraph.allPackages.values) {
    for (final generator in generators) {
      if (generator.filter(package)) {
        options._runGeneratorForPackage(generator, package);
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
