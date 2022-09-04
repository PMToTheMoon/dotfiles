// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:bonemeal_runner/src/environment/build_environment.dart';
import 'package:bonemeal_runner/src/package_graph/apply_generators.dart';

import 'build_impl.dart';
import 'build_result.dart';
import 'options.dart';

class BuildRunner {
  final BuildImpl _build;
  BuildRunner._(this._build);

  Future<void> beforeExit() => _build.beforeExit();

  Future<BuildResult> run() => _build.run();

  static Future<BuildRunner> create(BuildOptions options,
      BuildEnvironment environment, List<GeneratorApplication> builders,
      {bool isReleaseBuild = false}) async {
    return BuildRunner._(await BuildImpl.create(options, environment, builders,
        isReleaseBuild: isReleaseBuild));
  }
}
