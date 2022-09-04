import 'dart:async';

import 'package:bonemeal/bonemeal.dart';

export 'models_generator.dart';

abstract class Generator {
  const Generator();

  FutureOr<void> generate(BuildStep step);

  FutureOr<BuildStep> build(BuildStep? prevStep) {
    final step = prevStep != null ? BuildStep.from(prevStep) : BuildStep();
  }
}
