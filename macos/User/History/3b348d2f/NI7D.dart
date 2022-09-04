export 'models_generator.dart';
import 'dart:async';

abstract class Generator {
  const Generator();
  FutureOr<void> generate(BuildStep step);
}
