import 'dart:async';

import 'build_step.dart';

abstract class MetaObjectGenerator {
  const MetaObjectGenerator();

  FutureOr<void> build(
    BuildStep step,
    dynamic input,
  );
}
