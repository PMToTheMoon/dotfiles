import 'package:bonemeal_core/bonemeal_core.dart';

class ImportDependency extends Dependency {
  ImportDependency({
    super.ipr,
    super.output,
  });

  ImportDependency.fromShared(SharedAssetId ids) : super.fromShared(ids);

  // TODO: support '../' and absolute paths
  @override
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

class PartDependency extends Dependency {
  PartDependency({super.ipr, super.output});

  PartDependency.from(super.id) : super.from();

  PartDependency.fromShared(super.ids) : super.fromShared();

  @override
  String resolvePath(String path) => "part '$path';";
}

class D = Dependency with PathRes;

class PathRes {
  String resolvePath(String path) => "part '$path';";
}

class PartOfDependency extends Dependency {
  PartOfDependency({super.ipr, super.output});

  PartOfDependency.from(super.id) : super.from();

  PartOfDependency.fromShared(super.ids) : super.fromShared();

  @override
  String resolvePath(String path) => "part of '$path';";
}
