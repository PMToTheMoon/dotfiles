import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_runner/src/environment/io_environment.dart';
import 'package:bonemeal_runner/src/generate/build_options.dart';
import 'package:bonemeal_runner/src/generate/build_runner.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';

Future<void> build<Data, BuildMetaData>(
  MetaObject<Data, BuildMetaData> object,
  Data input,
) async {
  final packageGraph = await PackageGraph.forThisPackage();
  final environment = IOEnvironment(packageGraph);
  final options = await BuildOptions.create(
    packageGraph,
  );

  final runner = await BuildRunner.create(
    environment: environment,
    options: options,
  );

  await runner.run(object, input);
}
