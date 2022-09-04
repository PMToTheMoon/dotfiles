import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

abstract class MetaObjectGenerator {
  const MetaObjectGenerator();

  FutureOr<void> build(
    BuildStep step,
    AssetId id,
    String input,
  );
}
