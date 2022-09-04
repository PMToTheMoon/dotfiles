import 'package:acyclic_steps/acyclic_steps.dart';

import 'package:bonemeal/src/build_system/build_system.dart';

final Step<BuildStep> initial = Step.define('initial').build(() => BuildStep());

Future<void> build() async {
  await Runner().run(writeStep);
}
