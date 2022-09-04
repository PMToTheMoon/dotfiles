// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:bonemeal_runner/src/asset/reader.dart';
import 'package:glob/glob.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_config/bonemeal_config.dart';
import 'package:bonemeal_runner/src/generate/exceptions.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';

final _log = Logger('BuildConfigOverrides');

Future<BonemealConfig> rootBuildConfig(PackageGraph packageGraph) async {
  return _packageBuildConfig(packageGraph.root);
}

Future<Map<String, BonemealConfig>> findBuildConfigOverrides(
    PackageGraph packageGraph, RunnerAssetReader reader,
    {String? configKey}) async {
  final configs = <String, BonemealConfig>{};
  final configFiles =
      reader.findAssets(Glob('*.build.yaml'), package: packageGraph.root.name);
  await for (final id in configFiles) {
    final packageName = p.basename(id.path).split('.').first;
    final packageNode = packageGraph.allPackages[packageName];
    if (packageNode == null) {
      _log.warning('A build config override is provided for $packageName but '
          'that package does not exist. '
          'Remove the ${p.basename(id.path)} override or add a dependency '
          'on $packageName.');
      continue;
    }
    final yaml = await reader.readAsString(id);
    final config = BonemealConfig.parse(
      packageName,
      packageNode.dependencies.map((n) => n.name),
      yaml,
      configYamlPath: id.path,
    );
    configs[packageName] = config;
  }
  if (configKey != null) {
    final id = AssetId(packageGraph.root.name, 'build.$configKey.yaml');
    if (!await reader.canRead(id)) {
      _log.warning('Cannot find ${id.path} for specified config.');
      throw CannotBuildException();
    }
    final yaml = await reader.readAsString(id);
    final config = BonemealConfig.parse(
      packageGraph.root.name,
      packageGraph.root.dependencies.map((n) => n.name),
      yaml,
      configYamlPath: id.path,
    );
    if (config.generatorDefinitions.isNotEmpty) {
      _log.warning(
          'Ignoring `builders` configuration in `build.$configKey.yaml` - '
          'overriding builder configuration is not supported.');
    }
    configs[packageGraph.root.name] = config;
  }
  return configs;
}

Future<BonemealConfig> _packageBuildConfig(PackageNode package) async {
  final dependencyNames = package.dependencies.map((n) => n.name);
  return await BonemealConfig.fromBuildConfigDir(
      package.name, dependencyNames, package.path);
}
