import 'package:bonemeal/bonemeal.dart';

TestGenerator testGenerator(GeneratorOptions options) => TestGenerator();

class TestGenerator extends Generator {
  TestGenerator() {
    print("Test generator has been constructed !!!!");
  }

  final buildExtensions = const {
    ".dart": [".dart"]
  };

  @override
  void build() {}
}
