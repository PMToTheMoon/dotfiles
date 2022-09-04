import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

/// A generator that used source file content to determine
/// what meta_object generator should run on it
class ContentBasedGenerator<T> extends Generator {
  const ContentBasedGenerator(this.rootMetaObject);

  final MetaObjectGenerator<T> rootMetaObject;

  @override
  FutureOr<void> build(BuildStep step) {
    for (final id in step.inputs) {}
    throw UnimplementedError();
  }

  FutureOr<void> buildFor(
    BuildStep step,
    AssetId id,
    T input,
  ) {}
}
