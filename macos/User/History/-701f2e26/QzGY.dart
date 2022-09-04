import 'dart:svg';

import 'package:bonemeal_core/bonemeal_core.dart';

class InvalidDependencyException implements Exception {
  const InvalidDependencyException(this.message);
  final String message;
  @override
  String toString() => message;
}

class Dependency {
  Dependency({this.ipr, this.output}) : assert(ipr != null || output != null);

  Dependency.from(AssetId id)
      : assert(id.type == AssetType.ipr || id.type == AssetType.output),
        ipr = id.type == AssetType.ipr ? id : null,
        output = id.type == AssetType.output ? id : null;

  Dependency.fromShared(SharedAssetId ids)
      : ipr = ids.ipr,
        output = ids.output;

  final AssetId? ipr;
  final AssetId? output;

  String resolve(AssetId source) => '';
}
