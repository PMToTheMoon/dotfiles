// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_runner/src/asset_graph/graph.dart';
import 'package:logging/logging.dart';

final _log = Logger('FinalizedAssetView');

/// A lazily computed view of all the assets available after a build.
///
/// Note that this class has a limited lifetime during which it is available,
/// and should not be used outside of the scope in which it is given. It will
/// throw a [StateError] if you attempt to use it once it has expired.
class FinalizedAssetsView {
  final AssetGraph _assetGraph;
  bool _expired = false;

  FinalizedAssetsView(this._assetGraph);

  List<AssetId> allAssets({String? rootDir}) {
    if (_expired) {
      throw StateError(
          'Cannot use a FinalizedAssetsView after it has expired!');
    }
    return _assetGraph.getAllGenerated().toList();
  }

  void markExpired() {
    assert(!_expired);
    _expired = true;
  }
}
