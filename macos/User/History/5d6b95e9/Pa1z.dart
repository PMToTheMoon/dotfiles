import 'dart:io';

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
    // print("Hello world");

    // final asset = AssetId.ipr("test.dart");
    // step.writeAsString(asset, "hello world :)");

    final file : File
  }
}
