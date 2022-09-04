import 'package:bonemeal_core/bonemeal_core.dart';

class _Importresolver extends Dependency {
  String resolvePath(String path) => "part '$path';";
}

class PartDependency = Dependency with _PartResolver;

class _PartResolver {
  String resolvePath(String path) => "part '$path';";
}

class _PartOfResolver {
  @override
  String resolvePath(String path) => "part of '$path';";
}
