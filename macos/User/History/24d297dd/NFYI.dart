import 'package:acyclic_steps/acyclic_steps.dart';

import 'build_steps.dart';
import 'package:bonemeal/bonemeal.dart';

final Step<BuildStep> modelsStep = Step.define(
  'models',
).dep(parseConfig).build(ModelsGenerator().build);
