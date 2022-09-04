import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

abstract class FileContentBasedGenerator extends Generator {
  @override
  FutureOr<void> build(BuildStep step) {
    for (final input in step.inputs) {
      buildFor(input, step);
    }
  }

  FutureOr<void> buildFor(AssetId id, BuildStep step) {}
}
