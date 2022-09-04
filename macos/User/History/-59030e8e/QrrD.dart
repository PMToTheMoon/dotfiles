import 'package:path/path.dart';
import 'build_system.dart';

class BuildStep {
  BuildStep() : _contextOutput = BuildStepContext();
  BuildStep.from(BuildStep previous) : _contextOutput = previous._contextOutput;

  final BuildStepContext _contextOutput;

  BuildStepContext get context => _contextOutput;

  List<OutputAsset> buildContext() => _contextOutput.build();
}

class BuildStepContext {
  BuildStepContext() : _outputs = PathMap<AssetContentBuilder>();

  final PathMap<AssetContentBuilder> _outputs;

  AssetContentBuilder asset(path,
          {required AssetContentBuilder Function() ifAbsent}) =>
      _outputs.putIfAbsent(path, ifAbsent);

  DartAssetBuilder dartAsset(path) =>
      _outputs.putIfAbsent(path, () => DartAssetBuilder()) as DartAssetBuilder;

  List<OutputAsset> build() => _outputs.entries
      .map((entry) =>
          OutputAsset(path: entry.key!, content: entry.value.build()))
      .toList();
}