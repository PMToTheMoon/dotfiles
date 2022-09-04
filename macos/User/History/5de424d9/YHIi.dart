import 'package:build/build.dart';

Builder modelBuilder(BuilderOptions options) => ModelBuilder();

class ModelBuilder implements Builder {
  @override
  final buildExtensions = const {
    "^/models/{{}}.yaml": [".dart"]
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;
    final outputID = AssetId(inputId.package, "lib/models.dart");
    final contents = await buildStep.readAsString(inputId);
    await buildStep.writeAsString(outputID, contents);
  }
}
