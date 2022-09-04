import 'package:bonemeal_runner/src/environment/io_environment.dart';
import 'package:bonemeal_runner/src/generate/apply_meta_objects.dart';
import 'package:bonemeal_runner/src/generate/build_options.dart';
import 'package:bonemeal_runner/src/generate/apply_generators.dart';
import 'package:bonemeal_runner/src/generate/build_runner.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';

import 'build_result.dart';

Future<BuildResult> build(
  List<MetaObjectApplication> metaObjectApplications,
  List<GeneratorApplication> generatorsApplications,
  bool isReleaseBuild,
) async {
  final packageGraph = await PackageGraph.forThisPackage();
  final environment = IOEnvironment(packageGraph);
  final options = await BuildOptions.create(
    packageGraph,
    isReleaseBuild: isReleaseBuild,
  );

  final runner = await BuildRunner.create(
    metaObjectApplications,
    generatorsApplications,
    environment: environment,
    options: options,
  );

  return await runner.run();
}
