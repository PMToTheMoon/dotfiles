import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

/// A generator that used source file content to determine
/// what meta_object generator should run on it
abstract class ContentBasedGenerator<T> extends Generator {
  FutureOr<void> buildFor(BuildStep step, T input);
}
