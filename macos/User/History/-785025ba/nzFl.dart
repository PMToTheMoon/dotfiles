import 'package:acyclic_steps/acyclic_steps.dart';
import 'package:path/path.dart' as path;

import 'package:bonemeal_core/build_system/build_system.dart';
import 'package:bonemeal_core/global.dart';
import 'build_steps.dart';

final Step<void> writeStep = Step.define(
  'write',
).dep(modelsStep).build((BuildStep result) async {
  final contextAssets = result.buildContext();
  for (final ctxAsset in contextAssets) {
    final file = fs.file(
      path.join(contextPath, ctxAsset.path),
    );
    await file.create(recursive: true);
    await file.writeAsString(ctxAsset.content);
  }
});
