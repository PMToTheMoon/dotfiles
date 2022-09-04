import 'build_steps.dart';

final Step<BuildStep> modelsStep = Step.define(
  'models',
).dep(initial).build(ModelsGenerator().build);
