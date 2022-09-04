import 'package:bonemeal_core/bonemeal_core.dart';

class ImportDependency = Dependency with _ImportResolver;

class PartDependency = Dependency with _PartResolver;

class PartOfResolver = Dependency with _PartOfResolver;

class _ImportResolver {
  String resolvePath(String path) => "import '$path';";
}

class _PartResolver {
  String resolvePath(String path) => "part '$path';";
}

class _PartOfResolver {
  String resolvePath(String path) => "part of '$path';";
}
