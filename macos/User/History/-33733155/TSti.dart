import 'dart:io';

import 'package:acyclic_steps/acyclic_steps.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';

import 'package:bonemeal/asset/asset.dart';
import 'package:bonemeal/build_system/build_system.dart';

final Step<BuildAssets> runGeneratorsStep = Step.define(
  'parse_sources',
).build(() async {
  final dartFile = Glob('**.dart');
  final assets = <String, Asset>{};
  for (var entity in dartFile.listSync()) {
    final file = File(entity.path);
    assets[entity.path] = Asset(
      path: entity.path,
      content: await file.readAsString(),
    );
  }
  return BuildAssets(assets: assets);
});
