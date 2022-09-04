import 'package:build/build.dart';

Builder modelsBuilder(BuilderOptions options) => ModelsBuilder();

class ModelsBuilder implements Builder {
  @override
  final buildExtensions = const {
    "models.yaml": ["models.dart"]
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;
    final outputID = AssetId(inputId.package, "lib/models.dart");
    final contents = await buildStep.readAsString(inputId);
    await buildStep.writeAsString(outputID, contents);
  }
}
