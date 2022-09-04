import 'package:build/build.dart';

Builder modelBuilder(BuilderOptions options) => ModelBuilder();

class ModelBuilder implements Builder {
  @override
  final buildExtensions = const {
    "^/models/{{}}.yaml": ["generated/models/{{}}.dart"]
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final AssetId inputId = buildStep.inputId;
    final outputId = inputId.changeExtension(".dart");
    // final outputID = AssetId(inputId.package, "generated/models/${inputId.}.dart");
    final contents = await buildStep.readAsString(inputId);
    await buildStep.writeAsString(outputId, contents);
  }
}
