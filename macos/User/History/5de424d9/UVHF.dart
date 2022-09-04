import 'package:build/build.dart';

Builder modelBuilder(BuilderOptions options) => ModelBuilder();

class ModelBuilder implements Builder {
  @override
  final buildExtensions = const {
    "^lib/models/{{}}.yaml": ["generated/models/{{}}.dart"]
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final AssetId inputId = buildStep.inputId;
    // final outputId = inputId.changeExtension(".dart");
    print(inputId.path)
    final outputId = AssetId(inputId.package, "generated/models/{{}}.dart");
    final contents = await buildStep.readAsString(inputId);
    await buildStep.writeAsString(outputId, contents);
  }
}
