import 'package:acyclic_steps/acyclic_steps.dart';

import 'package:bonemeal/bonemeal.dart';

final Step<BuildStep> initial = Step.define('initial').build(() => BuildStep());

final Step<BuildStep> modelsStep = Step.define(
  'models',
).dep(initial).build(ModelsGenerator().build);

final Step<void> writeStep = Step.define(
  'write',
).dep(modelsStep).build((BuildStep result) async {
  final contextAssets = result.buildContext();
  for (final ctxAsset in contextAssets) {
    final file = fs.file(ctxAsset.path);
    await file.create(recursive: true);
    await file.writeAsString(ctxAsset.content);
  }
});

Future<void> generate() async {
  await Runner().run(writeStep);
}
