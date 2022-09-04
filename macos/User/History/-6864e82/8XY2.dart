// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'dart:async';

import 'build_step.dart';

/// The basic builder class, used to build new files from existing ones.
abstract class Generator {
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

  /// Creates a [BuildOptions] with sane defaults.
  ///
  /// NOTE: If a custom [resolvers] instance is passed it must ensure that it
  /// enables [enabledExperiments] on any analysis options it creates.
  static Future<BuildOptions> create(
    LogSubscription logSubscription, {
    Duration debounceDelay = const Duration(milliseconds: 250),
    bool deleteFilesByDefault = false,
    bool enableLowResourcesMode = false,
    required PackageGraph packageGraph,
    Map<String, BuildConfig> overrideBuildConfig = const {},
    bool skipBuildScriptCheck = false,
    bool trackPerformance = false,
    String? logPerformanceDir,
    Resolvers? resolvers,
  }) async {
    TargetGraph targetGraph;
    try {
      targetGraph = await TargetGraph.forPackageGraph(packageGraph,
          overrideBuildConfig: overrideBuildConfig,
          defaultRootPackageSources: defaultRootPackageSources,
          requiredSourcePaths: [r'lib/$lib$'],
          requiredRootSourcePaths: [r'$package$', r'lib/$lib$']);
    } on BuildConfigParseException catch (e, s) {
      _logger.severe('''
Failed to parse `build.yaml` for ${e.packageName}.

If you believe you have gotten this message in error, especially if using a new
feature, you may need to run `dart run build_runner clean` and then rebuild.
''', e.exception, s);
      throw CannotBuildException();
    }

    /// Set up other defaults.
    if (logPerformanceDir != null) {
      // Requiring this to be under the root package allows us to use an
      // `AssetWriter` to write logs.
      if (!p.isWithin(p.current, logPerformanceDir)) {
        _logger.severe('Performance logs may only be output under the root '
            'package, but got `$logPerformanceDir` which is not.');
        throw CannotBuildException();
      }
      trackPerformance = true;
    }
    resolvers ??= AnalyzerResolvers();

    return BuildOptions._(
      debounceDelay: debounceDelay,
      deleteFilesByDefault: deleteFilesByDefault,
      enableLowResourcesMode: enableLowResourcesMode,
      logListener: logSubscription.logListener,
      packageGraph: packageGraph,
      skipBuildScriptCheck: skipBuildScriptCheck,
      trackPerformance: trackPerformance,
      targetGraph: targetGraph,
      logPerformanceDir: logPerformanceDir,
      resolvers: resolvers,
    );
  }
}

/// Creates a [Generator] honoring the configuation in [options].
typedef GeneratorFactory = Generator Function(GeneratorOptions options);
