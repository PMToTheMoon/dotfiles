import 'package:acyclic_steps/acyclic_steps.dart';

import 'package:bonemeal/build_system/build_system.dart';
import 'build_steps.dart';

final Step<BuildStep> modelsStep = Step.define(
  'models',
).dep(parseConfig).build(ModelsGenerator().build);
