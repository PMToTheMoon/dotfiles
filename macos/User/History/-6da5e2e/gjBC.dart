// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'dart:async';

// import 'build_step.dart';

/// The basic builder class, used to build new files from existing ones.
abstract class Generator {
  /// Generates the outputs for a given [BuildStep].
  FutureOr<void> build(/*BuildStep buildStep*/);

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

class GeneratorOptions {
  /// A configuration with no options set.
  static const empty = GeneratorOptions({});

  /// A configuration with [isRoot] set to `true`, and no options set.
  static const forRoot = GeneratorOptions({}, isRoot: true);

  /// The configuration to apply to a given usage of a [Generator].
  ///
  /// A `Map` parsed from json or yaml. The value types will be `String`, `num`,
  /// `bool` or `List` or `Map` of these types.
  final Map<String, dynamic> config;

  /// Whether or not this builder is running on the root package.
  final bool isRoot;

  const GeneratorOptions(this.config, {this.isRoot = false});

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
          ..addAll(config)
          ..addAll(other.config),
        isRoot: other.isRoot);
  }
}

/// Creates a [Generator] honoring the configuation in [options].
typedef GeneratorFactory = Generator Function(GeneratorOptions options);
