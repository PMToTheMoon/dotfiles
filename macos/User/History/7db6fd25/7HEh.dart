import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

class MetaObjectBuildContext {
  MetaObjectBuildContext({
    required this.source,
  });
  final AssetId source;
}

abstract class MetaObjectGenerator<MObj> {
  const MetaObjectGenerator();

  MObj Function(String) get objectFactory;

  FutureOr<void> build(BuildStep step, MetaObjectBuildContext context);
}
