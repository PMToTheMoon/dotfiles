import 'build_steps.dart';

final Step<BuildStep> modelsStep = Step.define(
  'models',
).dep(parseConfig).build(ModelsGenerator().build);
