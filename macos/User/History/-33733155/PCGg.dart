import 'package:acyclic_steps/acyclic_steps.dart';

import 'package:bonemeal/src/bonemeal.dart';

final Step<BuildStep> runGeneratorsStep = Step.define(
  'run_generators',
).dep(parseConfig).build(ModelsGenerator().build);
