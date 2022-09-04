import 'package:bonemeal_runner/src/environment/io_environment.dart';
import 'package:bonemeal_runner/src/generate/build_result.dart';
import 'package:bonemeal_runner/src/generate/options.dart';
import 'package:bonemeal_runner/src/package_graph/apply_generators.dart';
import 'package:bonemeal_runner/src/package_graph/build_config_overrides.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';

Future<BuildResult> build(
  List<GeneratorApplication> generators, {
  PackageGraph? packageGraph,
  bool? assumeTty,
  String? configKey,
  bool? outputSymlinksOnly,
}) async {
  packageGraph ??= await PackageGraph.forThisPackage();

  final environement = IOEnvironment(
    packageGraph,
    assumeTty: assumeTty,
    outputSymlinksOnly: outputSymlinksOnly,
  );

  final options = BuildOptions.create(
    packageGraph: packageGraph,
    overrideBuildConfig: await findBuildConfigOverrides(
        packageGraph, environment.reader,
        configKey: configKey),
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
