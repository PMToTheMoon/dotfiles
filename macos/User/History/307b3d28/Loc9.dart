import 'package:bonemeal_core/bonemeal_core.dart';

Future<BuildResult?> build() async {
  final packageGraph = await PackageGraph.forThisPackage();
  final options = await BuildOptions.create(packageGraph: packageGraph);
  print(options.targetGraph.allModules);
}
