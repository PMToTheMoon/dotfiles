import 'package:bonemeal_runner/src/environment/io_environment.dart';
import 'package:bonemeal_runner/src/generate/build_result.dart';
import 'package:bonemeal_runner/src/generate/build_runner.dart';
import 'package:bonemeal_runner/src/generate/options.dart';
import 'package:bonemeal_runner/src/package_graph/apply_generators.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';

Future<BuildResult> build(
  List<GeneratorApplication> generators, {
  PackageGraph? packageGraph,
  bool? assumeTty,
  bool? outputSymlinksOnly,
  bool? isReleaseBuild,
}) async {
  outputSymlinksOnly ??= false;
  isReleaseBuild ??= false;
  packageGraph ??= await PackageGraph.forThisPackage();

  final environment = IOEnvironment(
    packageGraph,
    assumeTty: assumeTty,
    outputSymlinksOnly: outputSymlinksOnly,
  );

  runInB

  final options = await BuildOptions.create(
    packageGraph: packageGraph,
  );

  final build = await BuildRunner.create(
    options,
    environment,
    generators,
    isReleaseBuild: isReleaseBuild,
  );

  final result = await build.run();
  await build.beforeExit();

  return result;
}
