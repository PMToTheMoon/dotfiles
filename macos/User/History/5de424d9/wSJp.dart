import 'package:build/build.dart';

Builder modelsBuilder(BuilderOptions options) => ModelsBuilder();

class ModelsBuilder implements Builder {
  @override
  final buildExtensions = const {
    "^lib/{{}}/models.yaml": [".dart"]
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;
    final outputID = AssetId(inputId.package, "generated/models/models.dart");
    final contents = await buildStep.readAsString(inputId);
    await buildStep.writeAsString(outputID, contents);
  }
}
