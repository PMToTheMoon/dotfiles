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

    final ipr = AssetId.ipr("test.dart");
    final out = AssetId.output("test.dart");
    await step.writeAsString(ipr, "void helloWorld() {}");
    await step.writeAsString(out, "void helloWorld() {}");
  }
}
