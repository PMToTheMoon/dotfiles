// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:bonemeal_core/bonemeal_core';

/// A [RunnerAssetReader] must implement [MultiPackageAssetReader].
abstract class RunnerAssetReader implements MultiPackageAssetReader {}

/// An [AssetReader] that can provide actual paths to assets on disk.
abstract class PathProvidingAssetReader implements AssetReader {
  String pathTo(AssetId id);
}
