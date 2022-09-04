import 'package:bonemeal/bonemeal.dart';

TestGenerator testGenerator {}

class TestGenerator extends Generator {
  final buildExtensions = {
    ".dart": [".dart"]
  };

  @override
  void build() {}
}
