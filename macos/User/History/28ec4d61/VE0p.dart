import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_runner/bonemeal_runner.dart';
import 'package:bonemeal_runner/src/environment/io_environment.dart';
import 'package:bonemeal_runner/src/generate/build_options.dart';
import 'package:bonemeal_runner/src/generate/build_runner.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';
import 'package:logging/logging.dart';

final _log = Logger('build');

Future<void> buildObject<BuildMetaData>(
  MetaObject<BuildMetaData> object,
) async {
  initializeLogger();

  _log.info('Cleaning exported files...');
  await clean();

  _log.info('Preparing build environment...');
  final packageGraph = await PackageGraph.forThisPackage();
  final environment = IOEnvironment(packageGraph);
  final options = await BuildOptions.create(
    packageGraph,
  );

  _log.info('Building...');
  final runner = await BuildRunner.create(
    environment: environment,
    options: options,
  );

  await runner.run(
    object,
  );
}

//TODO: use a closure
Future<void> build<BuildMetaData>(
  RootBuilder builder,
) async {
  initializeLogger();

  _log.info('Cleaning exported files...');
  await clean();

  _log.info('Preparing build environment...');
  final packageGraph = await PackageGraph.forThisPackage();
  final environment = IOEnvironment(packageGraph);
  final options = await BuildOptions.create(
    packageGraph,
  );

  _log.info('Building...');
  final runner = await BuildRunner.create(
    environment: environment,
    options: options,
  );

  await runner.run(
    builder,
  );
}
