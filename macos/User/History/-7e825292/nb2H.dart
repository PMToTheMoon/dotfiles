import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

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
