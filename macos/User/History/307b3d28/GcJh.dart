import 'package:bonemeal_core/src/generate/generate.dart';

Future<BuildResult?> build() async {
  final packageGraph = await PackageGraph.forThisPackage();
  final options = BuildOptions.create(packageGraph: packageGraph);
}
