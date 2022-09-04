import 'package:acyclic_steps/acyclic_steps.dart';
import 'package:bonemeal/build_system/build_step.dart';
import 'package:bonemeal/generators/models_generator.dart';
import 'global.dart';

export 'generators/generators.dart';
export 'build_system/build_system.dart';
export 'utils/utils.dart';
export 'global.dart';

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

Future<void> build() async {
  await Runner().run(writeStep);
}
