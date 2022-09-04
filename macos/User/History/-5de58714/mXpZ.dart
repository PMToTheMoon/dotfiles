import 'dart:async';

/// The basic builder class, used to build new files from existing ones.
abstract class Generator {
  const Generator();

  /// Generates the outputs for a given [BuildStep].
  FutureOr<void> build(BuildStep buildStep);

  /// Mapping from input file extension to output file extensions.
  ///
  /// All input sources matching any key in this map will be passed as build
  /// step to this builder. Only files with the same basename and an extension
  /// from the values in this map are expected as outputs.
  ///
  /// - If an empty key exists, all inputs are considered matching.
  /// - An instance of a builder must always return the same configuration.
  ///   Typically, a builder will return a `const` map. Builders may also choose
  ///   extensions based on [GeneratorOptions].
  /// - Most builders will use a single input extension and one or more output
  ///   extensions.
  /// - For more information on build extensions, see
  ///   https://github.com/dart-lang/build/blob/master/docs/writing_a_builder.md#configuring-outputs
  Map<String, List<String>> get buildExtensions;
}

typedef GeneratorOptions = Map<String, dynamic>;

/// Creates a [Generator] honoring the configuation in [options].
typedef GeneratorFactory = Generator Function(GeneratorOptions options);
