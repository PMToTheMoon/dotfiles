import 'package:bonemeal_core/bonemeal_core.dart';

class InvalidDependencyException implements Exception {
  const InvalidDependencyException(this.message);
  final String message;
  @override
  String toString() => message;
}

class Dependency {
  Dependency({this.ipr, this.output}) : assert(ipr != null || output != null);
  Dependency.fromShared(SharedAssetId ids)
      : ipr = ids.ipr,
        output = ids.output;

  final AssetId? ipr;
  final AssetId? output;

  String resolve(AssetId source) {
    if (source.type == AssetType.ipr) {
      if (ipr == null) {
        throw InvalidDependencyException('Ipr is null for dependency');
      }
      return "import '${ipr.path}';";
    } else if (source.type == AssetType.output) {
      return 'package';
    } else {
      throw UnsupportedError('Dependency resolution is only supported'
          ' for assets of type "ipr" or "output".');
    }
  }
}
