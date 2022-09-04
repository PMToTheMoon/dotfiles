import 'package:bonemeal_core/src/generate/generate.dart';
import 'package:bonemeal_core/src/package_graph/package_graph.dart';

Future<BuildResult?> build() async {
  final packageGraph = await PackageGraph.forThisPackage();
  final options = await BuildOptions.create(packageGraph: packageGraph);
  print(options.targetGraph.allModules);
}
