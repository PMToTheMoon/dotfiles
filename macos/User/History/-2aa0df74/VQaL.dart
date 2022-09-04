// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:bonemeal_config/bonemeal_config.dart';
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

  /// If present, the path to a directory to write performance logs to.
  final String? logPerformanceDir;

  final PackageGraph packageGraph;
  final bool trackPerformance;

  // Watch mode options.
  Duration debounceDelay;

  // For testing only, skips the build script updates check.
  bool skipBuildScriptCheck;

  BuildOptions._({
    required this.debounceDelay,
    required this.deleteFilesByDefault,
    required this.enableLowResourcesMode,
    required this.packageGraph,
    required this.skipBuildScriptCheck,
    required this.trackPerformance,
    required this.logPerformanceDir,
  });

  /// Creates a [BuildOptions] with sane defaults.
  ///
  /// NOTE: If a custom [resolvers] instance is passed it must ensure that it
  /// enables [enabledExperiments] on any analysis options it creates.
  static Future<BuildOptions> create({
    Duration debounceDelay = const Duration(milliseconds: 250),
    bool deleteFilesByDefault = false,
    bool enableLowResourcesMode = false,
    required PackageGraph packageGraph,
    Map<String, BonemealConfig> overrideBuildConfig = const {},
    bool skipBuildScriptCheck = false,
    bool trackPerformance = false,
    String? logPerformanceDir,
  }) async {
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

    return BuildOptions._(
      debounceDelay: debounceDelay,
      deleteFilesByDefault: deleteFilesByDefault,
      enableLowResourcesMode: enableLowResourcesMode,
      packageGraph: packageGraph,
      skipBuildScriptCheck: skipBuildScriptCheck,
      trackPerformance: trackPerformance,
      logPerformanceDir: logPerformanceDir,
    );
  }
}
