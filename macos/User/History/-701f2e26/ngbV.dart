import 'dart:svg';

import 'package:bonemeal_core/bonemeal_core.dart';

class InvalidDependencyException implements Exception {
  const InvalidDependencyException(this.message);
  final String message;
  @override
  String toString() => message;
}

/// NOTE: this is the premiss of a header system implementation
/// Header system would allow to customize header based on asset type
/// It can manage import but also comments header
/// We can imagine a global header setup for example
/// The header system should not be designed especially for dart code
/// but instead follow a mire generic approach
abstract class Dependency {
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

  String resolvePath(String path);

  String resolve(AssetId source) {
    if (source.type == AssetType.ipr) {
      if (ipr == null) return '';
      return _toDirective(ipr!.path);
    } else if (source.type == AssetType.output) {
      if (output == null) {
        throw InvalidDependencyException(
            "Trying to resolve $source's dependency but output is null");
      }
      return _toDirective(output!.path);
    } else {
      throw UnsupportedError('Dependency resolution is only supported'
          ' for assets of type "ipr" or "output".');
    }
  }
}
