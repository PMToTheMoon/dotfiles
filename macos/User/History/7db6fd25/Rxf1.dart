import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

class MetaBuildContext {
  MetaBuildContext({
    required this.source,
  });
  final AssetId source;
  final int parent;
}

abstract class MetaObjectGenerator<MObj> {
  const MetaObjectGenerator();

  MObj Function(String) get objectFactory;

  FutureOr<void> build(BuildStep step, MetaBuildContext context);
}
