final Step<BuildStep> modelsStep = Step.define(
  'models',
).dep(initial).build(ModelsGenerator().build);
