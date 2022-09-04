import 'package:bonemeal_core/bonemeal_core.dart';

class CustomDependency extends Dependency {
  final String header;

  @override
  String resolvePath(String path) {
    // TODO: implement resolvePath
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
