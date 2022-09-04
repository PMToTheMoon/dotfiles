import 'dart:async';

/// The basic builder class, used to build new files from existing ones.
abstract class Generator {
  const Generator();

  /// Generates the outputs for a given [BuildStep].
  FutureOr<void> build();
}

typedef GeneratorOptions = Map<String, dynamic>;

/// Creates a [Generator] honoring the configuation in [options].
typedef GeneratorFactory = Generator Function(GeneratorOptions options);
