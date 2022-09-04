// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:glob/glob.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

import '../environment/build_environment.dart';
import '../package_graph/package_graph.dart';
import '../package_graph/target_graph.dart';
import 'exceptions.dart';

/// The default list of files visible for non-root packages.
///
/// This is also the default list of files for targets in non-root packages when
/// an explicit include is not provided.
const List<String> defaultNonRootVisibleAssets = [
  'CHANGELOG*',
  'lib/**',
  'bin/**',
  'LICENSE*',
  'pubspec.yaml',
  'README*',
];

/// The default list of files to include when an explicit include is not
/// provided.
///
/// This should be a superset of [defaultNonRootVisibleAssets].
const List<String> defaultRootPackageSources = [
  'assets/**',
  'benchmark/**',
  'bin/**',
  'CHANGELOG*',
  'example/**',
  'lib/**',
  'test/**',
  'tool/**',
  'web/**',
  'node/**',
  'LICENSE*',
  'pubspec.yaml',
  'pubspec.lock',
  'README*',
  r'$package$',
];

final _logger = Logger('BuildOptions');

/// Manages setting up consistent defaults for all options and build modes.
class BuildOptions {
  final bool deleteFilesByDefault;
  final bool enableLowResourcesMode;
  final StreamSubscription logListener;

  /// If present, the path to a directory to write performance logs to.
  final String? logPerformanceDir;

  final PackageGraph packageGraph;
  final TargetGraph targetGraph;
  final bool trackPerformance;

  // Watch mode options.
  Duration debounceDelay;

  // For testing only, skips the build script updates check.
  bool skipBuildScriptCheck;

  BuildOptions._({
    required this.debounceDelay,
    required this.deleteFilesByDefault,
    required this.enableLowResourcesMode,
    required this.logListener,
    required this.packageGraph,
    required this.skipBuildScriptCheck,
    required this.trackPerformance,
    required this.targetGraph,
    required this.logPerformanceDir,
  });

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
