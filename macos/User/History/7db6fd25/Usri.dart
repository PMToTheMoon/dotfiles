import 'dart:async';

import 'build_step.dart';

abstract class MetaObjectGenerator<T> {
  const MetaObjectGenerator();

  FutureOr<void> build(
    BuildStep step,
    T input,
  );
}
