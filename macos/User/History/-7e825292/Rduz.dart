import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

/// A generator that used source file content to determine
/// what meta_object generator should run on it
class ContentBasedGenerator<G extends MetaObjectGenerator> extends Generator {
  @override
  FutureOr<void> build(BuildStep step) {
    // TODO: implement build
    throw UnimplementedError();
  }

  FutureOr<void> buildFor(
    BuildStep step,
    AssetId id,
    T input,
  ) {}
}
