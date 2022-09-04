import 'dart:html';
import 'dart:math';

import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/src/environment/io_environment.dart';
import 'package:bonemeal_runner/src/generate/build_options.dart';
import 'package:bonemeal_runner/src/generate/build_runner.dart';
import 'package:bonemeal_runner/src/generate/apply_generators.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';
import 'package:glob/glob.dart';

import 'build_result.dart';

Future<BuildResult> build(
  List<GeneratorApplication> applications,
  bool isReleaseBuild,
) async {
  applications.forEach((element) => print(element.toString()));

  final packageGraph = await PackageGraph.forThisPackage();
  final environment = IOEnvironment(packageGraph);
  final options = await BuildOptions.create(
    packageGraph,
    isReleaseBuild: isReleaseBuild,
  );

  throw UnimplementedError();
}
