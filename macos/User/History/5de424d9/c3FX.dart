import 'package:build/build.dart';

Builder modelsBuilder(BuilderOptions options) => CopyBuilder();

class CopyBuilder implements Builder {
  @override
  final buildExtensions = const {
    "^lib/in.dart": ["generated/in.copy.dart"]
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    // Each `buildStep` has a single input.
    var inputId = buildStep.inputId;

    // Create a new target `AssetId` based on the old one.

    // var copy = inputId.changeExtension("bin/outputs/in.copy.dart");
    final outputID = AssetId(inputId.package, "generated/in.copy.dart");
    var contents = await buildStep.readAsString(inputId);

    // Write out the new asset.
    await buildStep.writeAsString(outputID, contents);
  }
}
