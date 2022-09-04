// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:bonemeal_config/bonemeal_config.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

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

  final PackageGraph packageGraph;

  BuildOptions._(
      {required this.deleteFilesByDefault, required this.packageGraph});

  /// Creates a [BuildOptions] with sane defaults.
  ///
  /// NOTE: If a custom [resolvers] instance is passed it must ensure that it
  /// enables [enabledExperiments] on any analysis options it creates.
  static Future<BuildOptions> create({
    bool deleteFilesByDefault = false,
    required PackageGraph packageGraph,
    BonemealConfig bonemealConfig = BonemealConfig(),
  }) async {
    return BuildOptions._(
      deleteFilesByDefault: deleteFilesByDefault,
      packageGraph: packageGraph,
    );
  }
}
