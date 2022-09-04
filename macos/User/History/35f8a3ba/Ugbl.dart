import 'dart:async';

// import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal/src/build_system/build_system.dart';

export 'models_generator.dart';

abstract class Generator {
  const Generator();

  FutureOr<void> generate(BuildStep step);

  FutureOr<BuildStep> build(BuildStep? prevStep) async {
    final step = prevStep != null ? BuildStep.from(prevStep) : BuildStep();
    await generate(step);
    return step;
  }
}
