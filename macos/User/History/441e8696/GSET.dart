import 'dart:math';

import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/src/environment/io_environment.dart';
import 'package:bonemeal_runner/src/generate/build_options.dart';
import 'package:bonemeal_runner/src/package_graph/apply_generators.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';
import 'package:glob/glob.dart';

import 'build_result.dart';

Future<BuildResult> build(List<GeneratorApplication> applications) async {
  applications.forEach((element) => print(element.toString()));

  final packageGraph = await PackageGraph.forThisPackage();
  final environment = IOEnvironment(packageGraph);
  final options = await BuildOptions.create(packageGraph);
  final sources = await _findSources();
  environment.reader

  throw UnimplementedError();
}

  Future<Set<AssetId>> _findSources({
    
    required AssetReader reader,
    required PackageGraph packageGraph,}) async {
    final Set<AssetId> assets = {};
    final filteredPackages = packageGraph.allPackages.entries.where(
      (entry) => _shouldRunOnPackage(entry.value),
    );
    for (final entry in filteredPackages) {
      assets.addAll(await reader
          .findAssets(Glob('lib/**'))
          .toSet());
    }
    return assets;
  }

  bool _shouldRunOnPackage(PackageNode package) {
    for (final generator in _generators) {
      if (generator.filter(package)) return true;
    }
    return false;
  }
