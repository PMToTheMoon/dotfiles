import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:meta/meta.dart';

/// A generator that used source file content to determine
/// what meta_object generator should run on it
class ContentBasedGenerator extends Generator {
  ContentBasedGenerator(String suffix, String key)
      : _root = MetaObjectRegistry.get(prefix, key)!;

  final MetaObject _root;

  @override
  @nonVirtual
  FutureOr<void> build(BuildStep step) async {
    for (final id in step.inputs) {
      final input = await step.readAsString(id);
      rootMetaObject.build(step, id, input);
    }
  }
}
