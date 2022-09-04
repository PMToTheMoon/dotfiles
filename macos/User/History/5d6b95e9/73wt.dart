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
    step.ipr.writeAsString(AssetId.ipr(":).output"), ":hap:");
    step.output.writeAsString(AssetId.output(":).output"), ":hap:");
  }
}
