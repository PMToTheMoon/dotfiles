import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:meta/meta.dart';

/// A generator that used source file content to determine
/// what meta_object generator should run on it
class ContentBasedGenerator extends Generator {
  const ContentBasedGenerator(this.rootMetaObject);

  final MetaObjectGenerator rootMetaObject;

  @override
  @nonVirtual
  FutureOr<void> build(BuildStep step) {
    for (final id in step.inputs) {
      rootMetaObject.build(step, id, input);
    }
  }
}
