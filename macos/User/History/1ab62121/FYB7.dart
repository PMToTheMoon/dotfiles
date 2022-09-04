import 'package:bonemeal_core/bonemeal_core.dart';

class CustomDependency implements Dependency {
  const CustomDependency(this.header);

  final String header;

  @override
  String resolvePath(String path) {
    return header;
  }

  @override
  // TODO: implement fallback
  String? get fallback => throw UnimplementedError();

  @override
  // TODO: implement ipr
  AssetId? get ipr => throw UnimplementedError();

  @override
  // TODO: implement output
  AssetId? get output => throw UnimplementedError();

  @override
  String resolve(AssetId source) {
    // TODO: implement resolve
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
