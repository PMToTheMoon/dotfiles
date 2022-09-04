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

  // TODO: support '../' and absolute paths
  String resolve(AssetId source) {
    if (source.type == AssetType.ipr) {
      if (ipr == null) {
        throw InvalidDependencyException(
            "Trying to resolve $source's dependency but ipr is null");
      }
      return "import '${ipr!.path}';";
    } else if (source.type == AssetType.output) {
      if (output == null) {
        throw InvalidDependencyException(
            "Trying to resolve $source's dependency but output is null");
      }
      return "import '${output!.path}';";
    } else {
      throw UnsupportedError('Dependency resolution is only supported'
          ' for assets of type "ipr" or "output".');
    }
  }
}
