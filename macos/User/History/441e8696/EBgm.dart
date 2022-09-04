import 'package:bonemeal_runner/src/environment/io_environment.dart';
import 'package:bonemeal_runner/src/package_graph/apply_generators.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';

import 'build_result.dart';

Future<BuildResult> build(List<GeneratorApplication> applications) async {
  applications.forEach((element) => print(element.toString()));

  final packageGraph = await PackageGraph.forThisPackage();
  final environment = IOEnvironment(packageGraph);

  throw UnimplementedError();
}
