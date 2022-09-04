// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';

/// A lazily computed view of all the assets available after a build.
///
/// Note that this class has a limited lifetime during which it is available,
/// and should not be used outside of the scope in which it is given. It will
/// throw a [StateError] if you attempt to use it once it has expired.
class FinalizedAssetsView {
  bool _expired = false;

  FinalizedAssetsView();

  List<AssetId> allAssets({String? rootDir}) {
    if (_expired) {
      throw StateError(
          'Cannot use a FinalizedAssetsView after it has expired!');
    }
    return [];
  }

  void markExpired() {
    assert(!_expired);
    _expired = true;
  }
}
