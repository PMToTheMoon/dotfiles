import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

abstract class MetaObjectGenerator<T> {
  const MetaObjectGenerator();

  FutureOr<void> build(
    BuildStep step,
    AssetId id,
    T input,
  );
}
