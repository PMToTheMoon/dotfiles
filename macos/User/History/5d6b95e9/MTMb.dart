import 'package:bonemeal/bonemeal.dart';

TestGenerator testGenerator(GeneratorOptions options) => TestGenerator();

class TestGenerator extends Generator {
  const TestGenerator();

  final buildExtensions = const {
    ".dart": [".dart"]
  };

  @override
  void build() {}
}
