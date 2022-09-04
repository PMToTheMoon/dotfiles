import 'package:acyclic_steps/acyclic_steps.dart';

import 'package:bonemeal/src/bonemeal.dart';

final Step<BuildStep> modelsStep = Step.define(
  'models',
).dep(parseConfig).build(ModelsGenerator().build);
