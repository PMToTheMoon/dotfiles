// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

@Deprecated('No longer used')
typedef OnDelete = void Function(AssetId id);

abstract class RunnerAssetWriter implements PathProvidingAssetReader {
  Future delete(AssetId id);
}
