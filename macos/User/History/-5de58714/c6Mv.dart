import 'dart:async';

/// The basic builder class, used to build new files from existing ones.
abstract class Generator {
  const Generator();

  /// Generates the outputs for a given [BuildStep].
  FutureOr<void> build();
}

class GeneratorOptions {
  static const empty = GeneratorOptions({});

  static const forRoot = GeneratorOptions({}, isRoot: true);

  /// The configuration to apply to a given usage of a [Generator].
  ///
  /// A `Map` parsed from json or yaml. The value types will be `String`, `num`,
  /// `bool` or `List` or `Map` of these types.
  final Map<String, dynamic> data;

  /// Whether or not this builder is running on the root package.
  final bool isRoot;

  const GeneratorOptions(this.data, {this.isRoot = false});

  /// Returns a new set of options with keys from [other] overriding options in
  /// this instance.
  ///
  /// Config values are overridden at a per-key granularity. There is no value
  /// level merging. [other] may be null, in which case this instance is
  /// returned directly.
  ///
  /// The `isRoot` value will also be overridden to value from [other].
  GeneratorOptions overrideWith(GeneratorOptions? other) {
    if (other == null) return this;
    return GeneratorOptions(
        {}
          ..addAll(data)
          ..addAll(other.data),
        isRoot: other.isRoot);
  }

  @override
  String toString() => '''
GeneratorOptions:
  isRoot: $isRoot
  config: $data
''';
}

/// Creates a [Generator] honoring the configuration in [options].
typedef GeneratorFactory = Generator Function(GeneratorOptions options);
