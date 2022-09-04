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
  const Dependency({
    this.ipr,
    this.output,
    this.fallback,
  });

  Dependency.override(
    Dependency other, {
    AssetId? ipr,
    AssetId? output,
    String? fallback,
  })  : ipr = ipr ?? other.ipr,
        output = output ?? other.output,
        fallback = fallback ?? other.fallback;

  Dependency.from(
    AssetId id, {
    this.fallback,
  })  : assert(id.type == AssetType.ipr || id.type == AssetType.output),
        ipr = id.type == AssetType.ipr ? id : null,
        output = id.type == AssetType.output ? id : null;

  Dependency.fromShared(
    SharedAssetId ids, {
    this.fallback,
  })  : ipr = ids.ipr,
        output = ids.output;

  final AssetId? ipr;
  final AssetId? output;
  final String? fallback;

  String resolvePath(String path);

  String resolve(AssetId source) {
    if (source.type == AssetType.ipr) {
      if (ipr == null) return fallback ?? '';
      return resolvePath(ipr!.path);
    } else if (source.type == AssetType.output) {
      if (output == null) return fallback ?? '';
      return resolvePath(output!.path);
    } else {
      throw UnsupportedError('Dependency resolution is only supported'
          ' for assets of type "ipr" or "output".');
    }
  }
}
