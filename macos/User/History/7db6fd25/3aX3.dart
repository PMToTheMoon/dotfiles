import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

class MetaObjectBuildContext {
  MetaObjectBuildContext({
    required this.source,
  });
  final AssetId source;
}

abstract class MetaObjectGenerator {
  const MetaObjectGenerator();

  FutureOr<void> build(
    BuildStep step,
  );
}
