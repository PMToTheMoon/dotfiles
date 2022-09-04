import 'package:bonemeal/bonemeal.dart';

TestGenerator testGenerator(GeneratorOptions options) => TestGenerator();

class TestGenerator extends Generator {
  final buildExtensions = {
    ".dart": [".dart"]
  };

  @override
  void build() {}
}
