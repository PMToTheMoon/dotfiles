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

    final asset = AssetId.ipr("test.dart");
    await step.writeAsString(asset, "hell world :)");
  }
}
