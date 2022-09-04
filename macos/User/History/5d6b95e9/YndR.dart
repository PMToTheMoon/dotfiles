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
  Future<void> build(BuildStep step) async {
    // print("Hello world");

    final ipr = AssetId.ipr("delete.dart");
    final out = AssetId.output("test.dart");
    await step.writeAsString(ipr, "hell0 world :)");
    await step.writeAsString(out, "hell0 world :)");
  }
}
