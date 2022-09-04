import 'package:bonemeal_core/bonemeal_core.dart';

class CustomDependency extends Dependency {
  const CustomDependency(this.header);

  final String header;

  @override
  String resolve(AssetId source) {
    return header;
  }

  @override
  String resolvePath(String path) {
    throw UnimplementedError();
  }
}

class Import = Dependency with _ImportResolver;

class Part = Dependency with _PartResolver;

class PartOf = Dependency with _PartOfResolver;

class _ImportResolver {
  String resolvePath(String path) => "import '$path';";
}

class _PartResolver {
  String resolvePath(String path) => "part '$path';";
}

class _PartOfResolver {
  String resolvePath(String path) => "part of '$path';";
}
