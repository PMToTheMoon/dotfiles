import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

/// A generator that used source file content to determine
/// what meta_object generator should run on it
class ContentBasedGenerator extends Generator {
  @override
  FutureOr<void> build(BuildStep step) {
    for (final input in step.inputs) {
      // find content type parser based on suffix
      // find meta-object generator
      // generate
    }
  }
}
