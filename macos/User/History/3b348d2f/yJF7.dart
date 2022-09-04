import 'dart:async';

import 'package:bonemeal/build/build.dart';

export 'models_generator.dart';

abstract class Generator {
  const Generator();

  FutureOr<void> generate(BuildStep step);

  FutureOr<BuildStep> build(BuildStep? prevStep);
}
