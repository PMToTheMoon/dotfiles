import 'package:acyclic_steps/acyclic_steps.dart';

import 'package:bonemeal_core/build_system/build_system.dart';
import 'package:bonemeal_core/build_steps/build_steps.dart';

final Step<BuildStep> initial = Step.define('initial').build(() => BuildStep());

Future<void> build() async {
  await Runner().run(writeStep);
}
