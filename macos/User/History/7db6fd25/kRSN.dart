import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

import 'build_step.dart';

abstract class MetaObjectGenerator<T> {
  const MetaObjectGenerator();

  FutureOr<void> build(
    BuildStep step,
    AssetId id,
    T input,
  );
}
