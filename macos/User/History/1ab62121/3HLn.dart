import 'package:bonemeal_core/bonemeal_core.dart';

class PartDependency = Dependency with _PartResolver;

class _ImportResolver extends Dependency {
  String resolvePath(String path) => "import '$path';";
}

class _PartResolver {
  String resolvePath(String path) => "part '$path';";
}

class _PartOfResolver {
  @override
  String resolvePath(String path) => "part of '$path';";
}
