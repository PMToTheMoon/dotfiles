import 'package:bonemeal/bonemeal.dart';

TestGenerator testGenerator(GeneratorOptions options) {
  print("TestGenerator constructed");
  print("Received options: $options");
  return TestGenerator();
}

class TestGenerator extends Generator {
  TestGenerator();

  final buildExtensions = const {
    ".dart": [".dart"]
  };

  @override
  void build(BuildStep step) {
    final package = step.inputs.first.package;
    final id = AssetId(package, ":).output");
    step.ipr.writeAsString(id, ":hap:");
    step.output.writeAsString(id, ":hap:");
  }
}
